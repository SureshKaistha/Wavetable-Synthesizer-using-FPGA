`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.12.2023 13:03:10
// Design Name: 
// Module Name: Wavetable_Record
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


module Wavetable_Record(
output [0:31] Wavetable_Rec,
input CLK,
input Mic_In,
input Record
    );
reg [0:31] WT=0;
reg [5:0] count=0;
reg done=0;
reg enable=1;
  

always@(posedge CLK or posedge Record)
begin
    if(Record==1)
    begin
    if (count <= 31) begin
        WT[count]<=Mic_In;
        count<=count+1;
        end
    end
    if(Record==0)
    begin
        count<=0;
    end
end
assign Wavetable_Rec = WT;
endmodule
