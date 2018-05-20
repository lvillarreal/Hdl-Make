#!/usr/bin/python
# En src se deben colocar los nombres de los archivos fuente sin extension 
src = ['RippleCarryAdder','FullAdder']

# En tb se debe colocar el nombre del testbench sin extension
tb = 'RippleCarryAdder_tb'

#En time se indica el tiempo de simulacion en microsegundos
time = 1000

# Se crea el Manifest.py en carpeta src
f = open('src/Manifest.py','w')
f.write('files = [ \n ')

for i in range(0,len(src)-1):
	f.write('"%s.vhd", '%(src[i]))
	#f.write(src[i]+'.vhd')
	#f.write('", ') 

f.write('"')
f.write(src[len(src)-1]+'.vhd')
f.write('"\n]\n') 
f.close();

# Se crea el Manifest.py en carpeta test
f = open('test/Manifest.py','w')
f.write('files = [ \n "%s.vhd", \n]\n' %(tb))
f.write('\nmodules = {\n "local" : [ "../src"],\n}\n')
f.close()

# Se crea el Manifest.py en la carpeta sim (simulacion)
f = open('sim/Manifest.py','w')
f.write('action = "simulation"\nsim_tool = "ghdl"\nsim_top = "%s"\n' %(tb))
f.write('\nsim_post_cmd = "ghdl -r %s --stop-time=%dus --vcd=%s.vcd; gtkwave %s.vcd"\n' %(tb,time,tb,tb))
f.write('\nmodules = {\n  "local" : [ "../test" ],\n}\n')

f.close()