set projDir "/home/folkloreee/Documents/blinding_lights/work/vivado"
set projName "blinding_lights"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "/home/folkloreee/Documents/blinding_lights/work/verilog/au_top_0.v" "/home/folkloreee/Documents/blinding_lights/work/verilog/seq_plus_twoSlow_1.v" "/home/folkloreee/Documents/blinding_lights/work/verilog/reset_conditioner_2.v" "/home/folkloreee/Documents/blinding_lights/work/verilog/eight_bit_shiftleft_3.v" "/home/folkloreee/Documents/blinding_lights/work/verilog/counter_4.v" "/home/folkloreee/Documents/blinding_lights/work/verilog/edge_detector_5.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "/home/folkloreee/Documents/blinding_lights/work/constraint/alchitry.xdc" "/home/folkloreee/Documents/alchitry-labs-1.2.1/library/components/au.xdc" "/home/folkloreee/Documents/blinding_lights/work/constraint/io.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1