set_global_assignment -entity "accumulator1" -library "lib_accumulator1" -name IP_TOOL_NAME "altera_fp_acc_custom"
set_global_assignment -entity "accumulator1" -library "lib_accumulator1" -name IP_TOOL_VERSION "20.1"
set_global_assignment -entity "accumulator1" -library "lib_accumulator1" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_accumulator1" -name SPD_FILE [file join $::quartus(sip_path) "accumulator1.spd"]

set_global_assignment -library "lib_accumulator1" -name MISC_FILE [file join $::quartus(sip_path) "accumulator1_sim/dspba_library_package.vhd"]
set_global_assignment -library "lib_accumulator1" -name MISC_FILE [file join $::quartus(sip_path) "accumulator1_sim/dspba_library.vhd"]
set_global_assignment -library "lib_accumulator1" -name MISC_FILE [file join $::quartus(sip_path) "accumulator1_sim/accumulator1.vhd"]
