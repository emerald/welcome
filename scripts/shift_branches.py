import sys
import re

if len(sys.argv) < 2:
    print("skriv tall som argument")
    sys.exit()

n = int(sys.argv[1])
past_goodline = False

with open("parse.m") as file:
    for line in file:
        goodline = re.search(r"(^\s*elseif\s+yym\s*=\s*)(\d+)(\s+then\s*$)", line)
        comline = re.search(r'(^\s*%\s*#line\s+)(\d+)(\s+"em_ecomp.y"\s*$)', line)
        if goodline:
            line_val = int(goodline.group(2))
            print(goodline.group(1), end="")
            print(line_val + (1 if line_val >= n else 0), end="")
            print(goodline.group(3), end="")
            past_goodline = line_val >= n
        elif past_goodline and comline:
            line_val = int(comline.group(2))
            print(comline.group(1), end="")
            print(line_val + 1, end="")
            print(comline.group(3), end="")
        else:
            print(line, end="")