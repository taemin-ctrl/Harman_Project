# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: C:\fpga_harman\250522_I2C_MASTER_MICROBLAZE\vitis\AXI4_LITE_I2C_PERIPH_system\_ide\scripts\systemdebugger_axi4_lite_i2c_periph_system_standalone.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source C:\fpga_harman\250522_I2C_MASTER_MICROBLAZE\vitis\AXI4_LITE_I2C_PERIPH_system\_ide\scripts\systemdebugger_axi4_lite_i2c_periph_system_standalone.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -filter {jtag_cable_name =~ "Digilent Basys3 210183BB7AB8A" && level==0 && jtag_device_ctx=="jsn-Basys3-210183BB7AB8A-0362d093-0"}
fpga -file C:/fpga_harman/250522_I2C_MASTER_MICROBLAZE/vitis/AXI4_LITE_I2C_PERIPH/_ide/bitstream/AXI4_LITE_I2C_PERIPH_wrapper.bit
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
loadhw -hw C:/fpga_harman/250522_I2C_MASTER_MICROBLAZE/vitis/AXI4_LITE_I2C_PERIPH_wrapper/export/AXI4_LITE_I2C_PERIPH_wrapper/hw/AXI4_LITE_I2C_PERIPH_wrapper.xsa -regs
configparams mdm-detect-bscan-mask 2
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
rst -system
after 3000
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
dow C:/fpga_harman/250522_I2C_MASTER_MICROBLAZE/vitis/AXI4_LITE_I2C_PERIPH/Debug/AXI4_LITE_I2C_PERIPH.elf
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
con
