set_global_assignment -entity "reciprocal1" -library "lib_reciprocal1" -name IP_TOOL_NAME "altera_fp_functions"
set_global_assignment -entity "reciprocal1" -library "lib_reciprocal1" -name IP_TOOL_VERSION "20.1"
set_global_assignment -entity "reciprocal1" -library "lib_reciprocal1" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_reciprocal1" -name SPD_FILE [file join $::quartus(sip_path) "reciprocal1.spd"]

set_global_assignment -library "lib_reciprocal1" -name MISC_FILE [file join $::quartus(sip_path) "reciprocal1_sim/reciprocal1_memoryC0_uid73_inverseTables_lutmem.hex"]
set_global_assignment -library "lib_reciprocal1" -name MISC_FILE [file join $::quartus(sip_path) "reciprocal1_sim/reciprocal1_memoryC0_uid74_inverseTables_lutmem.hex"]
set_global_assignment -library "lib_reciprocal1" -name MISC_FILE [file join $::quartus(sip_path) "reciprocal1_sim/reciprocal1_memoryC1_uid77_inverseTables_lutmem.hex"]
set_global_assignment -library "lib_reciprocal1" -name MISC_FILE [file join $::quartus(sip_path) "reciprocal1_sim/reciprocal1_memoryC2_uid80_inverseTables_lutmem.hex"]
set_global_assignment -library "lib_reciprocal1" -name MISC_FILE [file join $::quartus(sip_path) "reciprocal1_sim/reciprocal1.vo"]
