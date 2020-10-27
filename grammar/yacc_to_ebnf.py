inCurly = False

with open("grammar.y") as file:
    for line in file:
        if inCurly:
            if "}" in line:
                line = line[line.find("}") + 1 : ]
                inCurly = False
            else:
                continue
        elif "{" in line:
            if "}" in line:
                line = line[ : line.find("{")] + line[line.find("}") + 1 : ]
            else:
                inCurly = True
                line = line[ : line.find("{")]


        line = line.replace(":", "=")
        line = line.replace(";", ".")
        # if line != "\s++":
        if line.strip():
            print(line, end="")
    print()