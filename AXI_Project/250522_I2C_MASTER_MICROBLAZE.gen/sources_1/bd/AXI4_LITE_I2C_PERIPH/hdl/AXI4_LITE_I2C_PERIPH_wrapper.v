//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
//Date        : Fri May 23 16:05:00 2025
//Host        : DESKTOP-7CFQ9ND running 64-bit major release  (build 9200)
//Command     : generate_target AXI4_LITE_I2C_PERIPH_wrapper.bd
//Design      : AXI4_LITE_I2C_PERIPH_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module AXI4_LITE_I2C_PERIPH_wrapper
   (MISO,
    MOSI,
    SCL,
    SCLK,
    SDA,
    SS,
    btn_tri_i,
    reset,
    sys_clock,
    usb_uart_rxd,
    usb_uart_txd);
  input MISO;
  output MOSI;
  output SCL;
  output SCLK;
  inout SDA;
  output SS;
  input [3:0]btn_tri_i;
  input reset;
  input sys_clock;
  input usb_uart_rxd;
  output usb_uart_txd;

  wire MISO;
  wire MOSI;
  wire SCL;
  wire SCLK;
  wire SDA;
  wire SS;
  wire [3:0]btn_tri_i;
  wire reset;
  wire sys_clock;
  wire usb_uart_rxd;
  wire usb_uart_txd;

  AXI4_LITE_I2C_PERIPH AXI4_LITE_I2C_PERIPH_i
       (.MISO(MISO),
        .MOSI(MOSI),
        .SCL(SCL),
        .SCLK(SCLK),
        .SDA(SDA),
        .SS(SS),
        .btn_tri_i(btn_tri_i),
        .reset(reset),
        .sys_clock(sys_clock),
        .usb_uart_rxd(usb_uart_rxd),
        .usb_uart_txd(usb_uart_txd));
endmodule
