`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.12.2023 16:48:34
// Design Name: 
// Module Name: TopController
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module TopController(
output AUDIO,
output [3:0] LED,
output RECORDER_CLK,
output reg M_LRSEL=0,//To sample from mic at posedge of clock
input CLK,
input ENABLE,
input [0:14]Switch,
input BTNU,//For wavetable Selection
input BTNR,//For wavetable Recording
input MIC_IN
    );

reg [2:0] Table_Select=0;
reg enable=1;
wire BTN_U;
wire BTN_R;
always@(negedge BTN_U)
begin
    if(Table_Select<7) begin
        Table_Select<=Table_Select+1;
        end
     else Table_Select<=0;  
end

assign LED[0] = Table_Select[0];
assign LED[1] = Table_Select[1];
assign LED[2] = Table_Select[2];
assign LED[3] = BTNU;
ButtonDebounce ButtonU(BTN_U,BTNU,CLK);
ButtonDebounce ButtonR(BTN_R,BTNR,CLK);

Synthesizer Synth(.AUDIO_OUT(AUDIO),.recorder_clk(RECORDER_CLK),
                    .CLK(CLK),.ENABLE(ENABLE),.TableSelect(Table_Select),
                    .Switch(Switch),.Mic_In(MIC_IN),.Record(BTN_R));
Clock_divider #(.DIVISOR(100000)) 
                Audio_In_Clock (.clock_in(CLK), .enable(enable), .clock_out(RECORDER_CLK)); 
endmodule
