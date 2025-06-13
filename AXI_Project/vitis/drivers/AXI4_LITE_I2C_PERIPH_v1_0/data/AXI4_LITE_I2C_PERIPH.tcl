

proc generate {drv_handle} {
	xdefine_include_file $drv_handle "xparameters.h" "AXI4_LITE_I2C_PERIPH" "NUM_INSTANCES" "DEVICE_ID"  "C_S00_AXI_BASEADDR" "C_S00_AXI_HIGHADDR"
}
