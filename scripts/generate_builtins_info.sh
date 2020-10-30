#!/bin/sh

grep -rnwiP $EMERALDROOT/Builtins -e "builtin\s+0x[\da-f]{4}" \
| grep -oP "\w+(\s+\(\w+\))?\s+builtin\s+0x[\da-f]{4}" \
| sed 's/ builtin//' \
| python3 -c """
lst = []
while True:
    try:
        inp = input().split()
        if len(inp) > 2: inp = [''.join(inp[0:2]), inp[2]]
        if inp not in lst: lst.append(inp)
    except EOFError:
        break
[print(f'{num:10}{name}') for name, num in sorted(lst, key=lambda p:int(p[1], 16))]
"""
