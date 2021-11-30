#!/usr/bin/python3

import sys
import re
if len(sys.argv) < 2:
  print('enter asm source file name!')
  exit(-1)

asm_file_name = sys.argv[1]

source_file_pattern = '(.*)_raw.s'
match_obj = re.match(source_file_pattern, asm_file_name)
if not match_obj:
  print('expect raw asm file name: *_raw.s, but got: {}'.format(asm_file_name))
  exit(-1)

out_asm_file = '{}.s'.format(match_obj.group(1))

print('raw source file: {}'.format(asm_file_name))
print('ouput source file: {}'.format(out_asm_file))

max_line_len = 0
with open(asm_file_name, 'r') as src:
  for line in src:
    max_line_len = max(max_line_len, len(line))

with open(asm_file_name, 'r') as src, open(out_asm_file, 'w') as dst:

  for line in src:
    raw_line = line[:-1].ljust(max_line_len)
    dst_line = "{:<} {:<} {:>} \n".format("\"", raw_line, "\\n\"")
    dst.write(dst_line)

