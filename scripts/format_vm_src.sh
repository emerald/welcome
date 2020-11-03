cd $EMERALDROOT/vm/src
for f in {*.c,*.h}
do
    uncrustify -c $EMERALDROOT/scripts/custom_c_style.cfg --no-backup $f

done
# python3 -c """
# list = [41, 70, 73, 76, 101, 105, 109, 113, 266, 356, 359, 408, 414, 417, 500, 518, 614, 618, 683, 917, 1072, 1110, 1125, 1135, 1154, 1235, 1244, 1312, 1327, 1330, 1390, 1393, 1396, 1473, 1554, 1558, 1587, 1592, 1597, 1602, 1605, 1611, 1617, 1623, 1629, 1632, 1636, 1724, 1765, 1768, 1783, 1786, 1789, 1792, 1803, 1920, 1923, 1965, 2106, 2118, 2185, 2190, 2195, 2200, 2303, 2309, 2312, 2380, 2504, 2574, 2794, 2809, 2813, 2817, 2821, 2824, 2999, 3015, 3030, 3035]
# with open('custom_c_style.cfg') as f:
#     file = f.readlines()
#     i = 1
#     for line in file:
#         if i in list:
#             print('# ', end = '')
#         print(line, end='')
#         i += 1
#  """