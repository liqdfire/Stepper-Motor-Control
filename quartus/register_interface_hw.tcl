# TCL File Generated by Component Editor 14.0
# Fri Nov 21 11:51:12 CET 2014
# DO NOT MODIFY


# 
# register_interface "interface for registers (ctrlReg, speedReg, stepsReg)" v1.0.0
# Michael Riedel & Marc Kossmann 2014.11.21.11:51:12
# interface for registers (ctrlReg, speedReg, stepsReg)
# 

# 
# request TCL package from ACDS 14.0
# 
package require -exact qsys 14.0


# 
# module register_interface
# 
set_module_property DESCRIPTION "interface for registers (ctrlReg, speedReg, stepsReg)"
set_module_property NAME register_interface
set_module_property VERSION 1.0.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property GROUP "User Components"
set_module_property AUTHOR "Michael Riedel & Marc Kossmann"
set_module_property DISPLAY_NAME "interface for registers (ctrlReg, speedReg, stepsReg)"
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL register_interface
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file register_interface.vhd VHDL PATH IP/register_interface/register_interface.vhd TOP_LEVEL_FILE

add_fileset SIM_VHDL SIM_VHDL "" ""
set_fileset_property SIM_VHDL TOP_LEVEL register_interface
set_fileset_property SIM_VHDL ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property SIM_VHDL ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file register_interface.vhd VHDL PATH IP/register_interface/register_interface.vhd


# 
# parameters
# 


# 
# display items
# 


# 
# connection point reset
# 
add_interface reset reset end
set_interface_property reset associatedClock clock
set_interface_property reset synchronousEdges DEASSERT
set_interface_property reset ENABLED true
set_interface_property reset EXPORT_OF ""
set_interface_property reset PORT_NAME_MAP ""
set_interface_property reset CMSIS_SVD_VARIABLES ""
set_interface_property reset SVD_ADDRESS_GROUP ""

add_interface_port reset reset_n reset_n Input 1


# 
# connection point register_slave
# 
add_interface register_slave avalon end
set_interface_property register_slave addressUnits WORDS
set_interface_property register_slave associatedClock clock
set_interface_property register_slave associatedReset reset
set_interface_property register_slave bitsPerSymbol 8
set_interface_property register_slave burstOnBurstBoundariesOnly false
set_interface_property register_slave burstcountUnits WORDS
set_interface_property register_slave explicitAddressSpan 0
set_interface_property register_slave holdTime 0
set_interface_property register_slave linewrapBursts false
set_interface_property register_slave maximumPendingReadTransactions 0
set_interface_property register_slave maximumPendingWriteTransactions 0
set_interface_property register_slave readLatency 0
set_interface_property register_slave readWaitTime 1
set_interface_property register_slave setupTime 0
set_interface_property register_slave timingUnits Cycles
set_interface_property register_slave writeWaitTime 0
set_interface_property register_slave ENABLED true
set_interface_property register_slave EXPORT_OF ""
set_interface_property register_slave PORT_NAME_MAP ""
set_interface_property register_slave CMSIS_SVD_VARIABLES ""
set_interface_property register_slave SVD_ADDRESS_GROUP ""

add_interface_port register_slave ce_n chipselect_n Input 1
add_interface_port register_slave read_n read_n Input 1
add_interface_port register_slave write_n write_n Input 1
add_interface_port register_slave addr address Input 3
add_interface_port register_slave write_data writedata Input 32
add_interface_port register_slave read_data readdata Output 32
set_interface_assignment register_slave embeddedsw.configuration.isFlash 0
set_interface_assignment register_slave embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment register_slave embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment register_slave embeddedsw.configuration.isPrintableDevice 0


# 
# connection point clock
# 
add_interface clock clock end
set_interface_property clock clockRate 0
set_interface_property clock ENABLED true
set_interface_property clock EXPORT_OF ""
set_interface_property clock PORT_NAME_MAP ""
set_interface_property clock CMSIS_SVD_VARIABLES ""
set_interface_property clock SVD_ADDRESS_GROUP ""

add_interface_port clock clock clk Input 1


# 
# connection point conduit
# 
add_interface conduit conduit end
set_interface_property conduit associatedClock clock
set_interface_property conduit associatedReset reset
set_interface_property conduit ENABLED true
set_interface_property conduit EXPORT_OF ""
set_interface_property conduit PORT_NAME_MAP ""
set_interface_property conduit CMSIS_SVD_VARIABLES ""
set_interface_property conduit SVD_ADDRESS_GROUP ""

add_interface_port conduit redleds redleds Output 8
add_interface_port conduit greenleds greenleds Output 8
add_interface_port conduit speed speed Output 3
add_interface_port conduit steps steps Input 32
add_interface_port conduit ir ir Input 1
add_interface_port conduit run run Output 1
add_interface_port conduit direction direction Output 1
add_interface_port conduit mode mode Output 4


# 
# connection point interrupt_request
# 
add_interface interrupt_request interrupt end
set_interface_property interrupt_request associatedAddressablePoint register_slave
set_interface_property interrupt_request associatedClock clock
set_interface_property interrupt_request associatedReset reset
set_interface_property interrupt_request bridgedReceiverOffset ""
set_interface_property interrupt_request bridgesToReceiver ""
set_interface_property interrupt_request ENABLED true
set_interface_property interrupt_request EXPORT_OF ""
set_interface_property interrupt_request PORT_NAME_MAP ""
set_interface_property interrupt_request CMSIS_SVD_VARIABLES ""
set_interface_property interrupt_request SVD_ADDRESS_GROUP ""

add_interface_port interrupt_request irq irq Output 1

