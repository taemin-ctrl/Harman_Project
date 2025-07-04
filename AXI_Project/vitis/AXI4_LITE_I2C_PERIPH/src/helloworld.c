/******************************************************************************
 *
 * Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * Use of the Software is limited solely to applications:
 * (a) running on a Xilinx device, or
 * (b) that interact with a Xilinx device through a bus or interconnect.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 * XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
 * OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 *
 * Except as contained in this notice, the name of the Xilinx shall not be used
 * in advertising or otherwise to promote the sale, use or other dealings in
 * this Software without prior written authorization from Xilinx.
 *
 ******************************************************************************/

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include <stdint.h> // uint32_t를 사용하기 위함.
#include "platform.h"
#include "xil_printf.h"
#include "xparameters.h" // (ctrl + space bar 하면 자동완성 기능) -> baase addr 확인가능
#include "sleep.h" // delay 가능


typedef struct {
	volatile uint32_t tx_data; // 8bit tx data
	volatile uint32_t rx_data; // 8bit rx data
	volatile uint32_t mode; // 00: send data, 01:send start, 10: send stop, 11: read data
	volatile uint32_t enable; // 1bit enable
	volatile uint32_t done; // 1bit done
	volatile uint32_t ready; // 1bit ready
} I2C_TypeDef;


#define I2C_BASEADDR 0x44A00000  // (U:unsigned)
#define I2C ((I2C_TypeDef*)(I2C_BASEADDR))

void send_start(I2C_TypeDef* I2Cx);
void send_data(I2C_TypeDef* I2Cx, uint32_t data);
uint32_t read_data(I2C_TypeDef* I2Cx);
void send_stop(I2C_TypeDef* I2Cx);

int main(){
	uint32_t temp = 0;
	int addr = 1;
	while(1){
		send_start(I2C);
		send_data(I2C,addr<<1);
		send_data(I2C,temp);
		send_stop(I2C);
		temp++;
		if(temp == 128){
			temp = 0;
		}
		usleep(300000);
	}
	return 0;
}

void send_start(I2C_TypeDef* I2Cx)
{
	if(I2Cx->ready == 1){
		I2Cx->mode = 1;
		I2Cx->enable = 1;
		I2Cx->enable = 0;
	}
	while(I2Cx->ready != 1){}
	return;
}
void send_data(I2C_TypeDef* I2Cx, uint32_t data)
{
	if(I2Cx->ready == 1){
		I2Cx->tx_data = data;
		I2Cx->mode = 0;
		I2Cx->enable = 1;
		I2Cx->enable = 0;
	}
	while(I2Cx->ready != 1){}
	return;
}
uint32_t read_data(I2C_TypeDef* I2Cx){
	if(I2Cx->ready == 1){
		I2Cx->mode = 3;
		I2Cx->enable = 1;
		I2Cx->enable = 0;
	}
	while(I2Cx->ready != 1){}
	return I2Cx->rx_data;
}
void send_stop(I2C_TypeDef* I2Cx)
{
	if(I2Cx->ready == 1){
		I2Cx->mode = 2;
		I2Cx->enable = 1;
		I2Cx->enable = 0;
	}
	while(I2Cx->ready != 1){}
	return;
}


