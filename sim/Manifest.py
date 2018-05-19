action = "simulation"
sim_tool = "ghdl"
sim_top = "RippleCarryAdder_tb"

sim_post_cmd = "ghdl -r RippleCarryAdder_tb --stop-time=1000us --vcd=RippleCarryAdder_tb.vcd; gtkwave RippleCarryAdder_tb.vcd"

modules = {
  "local" : [ "../test" ],
}
