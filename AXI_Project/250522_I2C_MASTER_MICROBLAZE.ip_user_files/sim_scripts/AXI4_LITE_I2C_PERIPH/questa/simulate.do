onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib AXI4_LITE_I2C_PERIPH_opt

do {wave.do}

view wave
view structure
view signals

do {AXI4_LITE_I2C_PERIPH.udo}

run -all

quit -force
