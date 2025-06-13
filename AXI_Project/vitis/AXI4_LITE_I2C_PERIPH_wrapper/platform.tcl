# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\fpga_harman\250522_I2C_MASTER_MICROBLAZE\vitis\AXI4_LITE_I2C_PERIPH_wrapper\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\fpga_harman\250522_I2C_MASTER_MICROBLAZE\vitis\AXI4_LITE_I2C_PERIPH_wrapper\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {AXI4_LITE_I2C_PERIPH_wrapper}\
-hw {C:\fpga_harman\250522_I2C_MASTER_MICROBLAZE\vitis\AXI4_LITE_I2C_PERIPH_wrapper.xsa}\
-fsbl-target {psu_cortexa53_0} -out {C:/fpga_harman/250522_I2C_MASTER_MICROBLAZE/vitis}

platform write
domain create -name {standalone_microblaze_0} -display-name {standalone_microblaze_0} -os {standalone} -proc {microblaze_0} -runtime {cpp} -arch {32-bit} -support-app {hello_world}
platform generate -domains 
platform active {AXI4_LITE_I2C_PERIPH_wrapper}
platform generate -quick
platform generate
platform active {AXI4_LITE_I2C_PERIPH_wrapper}
platform config -updatehw {C:/fpga_harman/250522_I2C_MASTER_MICROBLAZE/AXI4_LITE_I2C_PERIPH_wrapper(2).xsa}
platform config -updatehw {C:/fpga_harman/250522_I2C_MASTER_MICROBLAZE/AXI4_LITE_I2C_PERIPH_wrapper(2).xsa}
