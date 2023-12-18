`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.12.2023 15:32:09
// Design Name: 
// Module Name: Wavetable_Synth
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


module Wavetable_Synth(
output AudioBit,
input CLK,
input  [0:31] wavetable,
input Switch
    );
reg [0:4]count=0;
reg AudioBitReg;

assign AudioBit = AudioBitReg;
    always @(posedge CLK)
    begin
    if (Switch) begin
        if (count<31) begin
            AudioBitReg <= wavetable[count];
            count<=count+1;
            end
        else begin
            AudioBitReg <= wavetable[count];
            count<=0;
        end
        end
    else AudioBitReg<=0; 
    end
endmodule
