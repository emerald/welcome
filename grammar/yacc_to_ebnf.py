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


        line = line.replace(":", "::=")
        line = " ".join([f"'{w}'" if w.isupper()  \
            else f"<{w}>" if not (";" in w or "|" in w or "::=" in w)  \
            else w for w in line.strip().split()])

        if line.strip():
            print(line)
    print()
