
import sys
import os

src = (['RippleCarryAdder.vhd','FullAdder.vhd'])



tb = 'RippleCarryAdder_tb.vhd'

f = open('src/Manifest.py','w')
f.write('files = [ \n ')
i = len(src);
while i != 1:
	f.write('"')
	f.write(src[i])
	f.write('", ') 
	i = i-1

f.write('"')
f.write(src[1])
f.write('"\n]') 
f.close();


