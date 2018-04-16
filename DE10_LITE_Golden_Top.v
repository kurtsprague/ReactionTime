// ============================================================================
//   Ver  :| Author					:| Mod. Date :| Changes Made:
//   V1.1 :| Alexandra Du			:| 06/01/2016:| Added Verilog file
// ============================================================================


//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

`define ENABLE_ADC_CLOCK
`define ENABLE_CLOCK1
`define ENABLE_CLOCK2
`define ENABLE_SDRAM
`define ENABLE_HEX0
`define ENABLE_HEX1
`define ENABLE_HEX2
`define ENABLE_HEX3
`define ENABLE_HEX4
`define ENABLE_HEX5
`define ENABLE_KEY
`define ENABLE_LED
`define ENABLE_SW
`define ENABLE_VGA
`define ENABLE_ACCELEROMETER
`define ENABLE_ARDUINO
`define ENABLE_GPIO

module DE10_LITE_Golden_Top(

	//////////// ADC CLOCK: 3.3-V LVTTL //////////
`ifdef ENABLE_ADC_CLOCK
	input 		          		ADC_CLK_10,
`endif
	//////////// CLOCK 1: 3.3-V LVTTL //////////
`ifdef ENABLE_CLOCK1
	input 		          		MAX10_CLK1_50,
`endif
	//////////// CLOCK 2: 3.3-V LVTTL //////////
`ifdef ENABLE_CLOCK2
	input 		          		MAX10_CLK2_50,
`endif

	//////////// SDRAM: 3.3-V LVTTL //////////
`ifdef ENABLE_SDRAM
	output		    [12:0]		DRAM_ADDR,
	output		     [1:0]		DRAM_BA,
	output		          		DRAM_CAS_N,
	output		          		DRAM_CKE,
	output		          		DRAM_CLK,
	output		          		DRAM_CS_N,
	inout 		    [15:0]		DRAM_DQ,
	output		          		DRAM_LDQM,
	output		          		DRAM_RAS_N,
	output		          		DRAM_UDQM,
	output		          		DRAM_WE_N,
`endif

	//////////// SEG7: 3.3-V LVTTL //////////
`ifdef ENABLE_HEX0
	output		     [7:0]		HEX0,
`endif
`ifdef ENABLE_HEX1
	output		     [7:0]		HEX1,
`endif
`ifdef ENABLE_HEX2
	output		     [7:0]		HEX2,
`endif
`ifdef ENABLE_HEX3
	output		     [7:0]		HEX3,
`endif
`ifdef ENABLE_HEX4
	output		     [7:0]		HEX4,
`endif
`ifdef ENABLE_HEX5
	output		     [7:0]		HEX5,
`endif

	//////////// KEY: 3.3 V SCHMITT TRIGGER //////////
`ifdef ENABLE_KEY
	input 		     [1:0]		KEY,
`endif

	//////////// LED: 3.3-V LVTTL //////////
`ifdef ENABLE_LED
	output		     [9:0]		LEDR,
`endif

	//////////// SW: 3.3-V LVTTL //////////
`ifdef ENABLE_SW
	input 		     [9:0]		SW,
`endif

	//////////// VGA: 3.3-V LVTTL //////////
`ifdef ENABLE_VGA
	output		     [3:0]		VGA_B,
	output		     [3:0]		VGA_G,
	output		          		VGA_HS,
	output		     [3:0]		VGA_R,
	output		          		VGA_VS,
`endif

	//////////// Accelerometer: 3.3-V LVTTL //////////
`ifdef ENABLE_ACCELEROMETER
	output		          		GSENSOR_CS_N,
	input 		     [2:1]		GSENSOR_INT,
	output		          		GSENSOR_SCLK,
	inout 		          		GSENSOR_SDI,
	inout 		          		GSENSOR_SDO,
`endif

	//////////// Arduino: 3.3-V LVTTL //////////
`ifdef ENABLE_ARDUINO
	inout 		    [15:0]		ARDUINO_IO,
	inout 		          		ARDUINO_RESET_N,
`endif

	//////////// GPIO, GPIO connect to GPIO Default: 3.3-V LVTTL //////////
`ifdef ENABLE_GPIO
	inout 		    [35:0]		GPIO
`endif
);



//=======================================================
//  REG/WIRE declarations
//=======================================================
wire delclk;

wire clenable;
wire [6:0] LFSRout;

wire enable;
wire BCD0clear;
wire BCD1enable;
wire BCD2enable;
wire BCD3enable;
wire BCDstop;
wire BCDdecoderenable0;
wire BCDdecoderenable1; 
wire BCDdecoderenable2;
wire[3:0] BCD0;
wire[3:0] BCD1;
wire[3:0] BCD2;
wire clear;
wire outputcomplete;
reg[11:0] prevhigh;
reg[11:0] currenthigh;
wire[11:0] highscore;
wire highscoreenable;
wire[11:0] currentrt;
wire[41:0] modeoutput;
reg button0state;
reg button1state;
wire[3:0] LFSR0;
wire[3:0] LFSR1;
wire[41:0] outbuffs;
wire[41:0] high;
wire[41:0] currentreaction;
wire buffclock;
wire [2:0] rand3bitlfsr;
wire randin;
wire[13:0] stopin; 

//=======================================================
//  Structural coding
//=======================================================
always@(posedge KEY[0])
begin
	button0state = button0state ^ 1;
end

always@(posedge KEY[1])
begin
	button1state = button1state ^ 1;
end

statemachine S1(MAX10_CLK1_50,SW[0],button0state,button1state,SW[1],enable,BCDstop,outputcomplete,highscoreenable);
clkdiv A1(MAX10_CLK1_50,delclk);

//random switch input code, uncomment this, then remove line 199
/*lfsrstop LF1(MAX10_CLK1_50,enable,rand3bitlfsr);
randomstopmux RM1(SW[3],SW[4],SW[5],SW[6],SW[7],SW[8],SW[9],KEY[1],rand3bitlfsr,randin);
randominputsevenseg RISS1(rand3bitlfsr,currentreaction[34:21]);*/
LFSR B1(MAX10_CLK1_50, enable, clenable,LFSRout);
lighter C1(delclk,clenable,LFSRout, LEDR[0],BCD0clear);


bcd3counter BCD30(delclk,BCD0clear,BCDstop,BCD0,BCD1,BCD2);

assign currentrt[11:8] = BCD2;
assign currentrt[7:4] = BCD1;
assign currentrt[3:0] = BCD0;

BCDdecoder D1(currentrt[3:0],currentreaction[6:0]);
BCDdecoder D2(currentrt[7:4],currentreaction[13:7]);
BCDdecoder D3(currentrt[11:8],currentreaction[20:14]);
assign currentreaction[34:21] = 14'b11111111111111;
assign currentreaction[41:35] = 7'b0101111;

always@(posedge outputcomplete)
begin
	currenthigh[11:8] = BCD2;
	currenthigh[7:4] = BCD1;
	currenthigh[3:0] = BCD0;
	if(prevhigh == 12'b000000000000)
		prevhigh = currenthigh;
	else if(prevhigh > currenthigh)
		prevhigh = currenthigh;
end

assign highscore = prevhigh;

BCDdecoder D4(highscore[3:0],high[6:0]);
BCDdecoder D5(highscore[7:4],high[13:7]);
BCDdecoder D6(highscore[11:8],high[20:14]);
assign high[27:21] = 7'b1111111;
assign high[41:28] = 14'b00010010010010;

defparam A2.pclk = 5000000;
clkdiv A2(MAX10_CLK1_50,buffclock);
gobuffs GB1(buffclock,outbuffs);

threetoonemux M1(enable,highscoreenable,currentreaction,high,outbuffs,modeoutput);

assign HEX5[6:0] = modeoutput[41:35];
assign HEX4[6:0] = modeoutput[34:28];
assign HEX3[6:0] = modeoutput[27:21];
assign HEX2[6:0] = modeoutput[20:14];
assign HEX1[6:0] = modeoutput[13:7];
assign HEX0[6:0] = modeoutput[6:0];

assign HEX5[7] = 1;
assign HEX4[7] = 1;
assign HEX3[7] = 1;
assign HEX2[7] = 1;
assign HEX1[7] = 1;
assign HEX0[7] = 1;


endmodule