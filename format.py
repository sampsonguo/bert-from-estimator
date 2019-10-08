#!/usr/bin/python
import json
import sys

in_file = sys.argv[1]
out_file = sys.argv[2]

inFp = open(in_file, 'r')
outFp = open(out_file, 'w')

while True:
    line = inFp.readline().strip()
    if not line:
        break
    text = json.loads(line)
outFp.write("%s"%(",".join(map(str, text['features'][0]['layers'][0]['values']))))


