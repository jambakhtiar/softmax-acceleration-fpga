set_global_assignment -entity "multiplier1" -library "lib_multiplier1" -name IP_TOOL_NAME "altera_fp_functions"
set_global_assignment -entity "multiplier1" -library "lib_multiplier1" -name IP_TOOL_VERSION "20.1"
set_global_assignment -entity "multiplier1" -library "lib_multiplier1" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_multiplier1" -name SPD_FILE [file join $::quartus(sip_path) "multiplier1.spd"]

set_global_assignment -library "lib_multiplier1" -name MISC_FILE [file join $::quartus(sip_path) "multiplier1_sim/multiplier1.vo"]
