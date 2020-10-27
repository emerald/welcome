from sys import argv, exit

if len(argv) < 2:
    print("usage: python3 reindent.py <filename> [<filename> ...]")
    exit()

keywords = ["if", "else", "elseif", "failure", "unavailable", "object",
            "typeobject", "class", "for", "loop", "op", "operation", "function",
            "begin", "process", "initially", "enumeration", "record", "recovery"]

numSpaces = 4
spaces = numSpaces * " "

def custom_split(s):
    res = s.split()
    isString = False
    theString = ""
    strStart = 0
    i = 0
    while i < len(res):
        if '"' in res[i].replace('\\"', ''):
            if not isString:
                theString = ""
                strStart = i
            else:
                theString += res[i]
                res = res[:strStart] + [theString] + res[i+1:]
                i -= (i - strStart)

            isString = not isString

        if isString:
            theString += res[i] + " "
        i += 1

    for i in range(len(res)):
        if "%" in res[i] and not '"' in res[i]:
            res[i] = res[i][0:res[i].find("%")]
            break

    return res[0:i+1]

for fn in argv[1:]:

    with open(fn, "r") as f:
        lines = f.readlines()

    with open(fn, "w") as f:
        i = 0
        inTypeobject = False

        for line in lines:
            line = line.strip()
            words = custom_split(line.lower())

            if words and "%" in words[0]:
                f.write((spaces * i) + line)
            # one-liner ifs
            elif len(list(filter(lambda x: x in keywords, words))) >= 2:
                f.write((spaces * i) + line)
            elif "end" in words:
                inTypeobject = False
                i -= 1
                f.write((spaces * i) + line)
            elif inTypeobject:
                f.write((spaces * i) + line)
            elif any(kw in words for kw in keywords):
                if "else" in words or "elseif" in words:
                    i -= 1
                elif "typeobject" in words:
                    inTypeobject = True
                f.write((spaces * i) + line)
                i += 1
            else:
                f.write((spaces * i) + line)
            f.write("\n")
