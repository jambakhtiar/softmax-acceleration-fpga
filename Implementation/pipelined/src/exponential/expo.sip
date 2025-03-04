set_global_assignment -entity "expo" -library "lib_expo" -name IP_TOOL_NAME "altera_fp_functions"
set_global_assignment -entity "expo" -library "lib_expo" -name IP_TOOL_VERSION "20.1"
set_global_assignment -entity "expo" -library "lib_expo" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_expo" -name SPD_FILE [file join $::quartus(sip_path) "expo.spd"]

set_global_assignment -library "lib_expo" -name MISC_FILE [file join $::quartus(sip_path) "expo_sim/expo.vo"]
