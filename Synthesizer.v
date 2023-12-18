`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.12.2023 16:32:05
// Design Name: 
// Module Name: Synthesizer
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


module Synthesizer( 
output reg AUDIO_OUT,
input recorder_clk,
input CLK,
input ENABLE,
input [2:0] TableSelect,
input [0:14] Switch,
input Mic_In,
input Record
    );
wire [14:0] CLOCK_ARRAY ;



ClockGen ClockGen(.CLOCK_ARRAY(CLOCK_ARRAY), .CLK(CLK), .enable(ENABLE));

//Wavetable_Record WT_Rec(.Wavetable_Rec(Wavetable_Rec),.CLK(recorder_clk),
                        //.Mic_In(Mic_In),.Record(Record));

Note E3(AudioBitE3, CLOCK_ARRAY[0], TableSelect, Switch[0], Record, Wavetable_Rec);
Note F3(AudioBitF3, CLOCK_ARRAY[1], TableSelect, Switch[1], Record, Wavetable_Rec);
Note G3(AudioBitG3, CLOCK_ARRAY[2], TableSelect, Switch[2], Record, Wavetable_Rec);
Note A4(AudioBitA4, CLOCK_ARRAY[3], TableSelect, Switch[3], Record, Wavetable_Rec);
Note B4(AudioBitB4, CLOCK_ARRAY[4], TableSelect, Switch[4], Record, Wavetable_Rec);
Note C4(AudioBitC4, CLOCK_ARRAY[5], TableSelect, Switch[5], Record, Wavetable_Rec);
Note D4(AudioBitD4, CLOCK_ARRAY[6], TableSelect, Switch[6], Record, Wavetable_Rec);
Note E4(AudioBitE4, CLOCK_ARRAY[7], TableSelect, Switch[7], Record, Wavetable_Rec);
Note F4(AudioBitF4, CLOCK_ARRAY[8], TableSelect, Switch[8], Record, Wavetable_Rec);
Note G4(AudioBitG4, CLOCK_ARRAY[9], TableSelect, Switch[9], Record, Wavetable_Rec);
Note A5(AudioBitA5, CLOCK_ARRAY[10], TableSelect, Switch[10], Record, Wavetable_Rec);
Note B5(AudioBitB5, CLOCK_ARRAY[11], TableSelect, Switch[11], Record, Wavetable_Rec);
Note C5(AudioBitC5, CLOCK_ARRAY[12], TableSelect, Switch[12], Record, Wavetable_Rec);
Note D5(AudioBitD5, CLOCK_ARRAY[13], TableSelect, Switch[13], Record, Wavetable_Rec);
Note E5(AudioBitE5, CLOCK_ARRAY[14], TableSelect, Switch[14], Record, Wavetable_Rec);

always@(posedge CLK)
begin
    AUDIO_OUT=AudioBitE3||AudioBitF3||AudioBitG3||AudioBitA4||AudioBitB4||AudioBitC4||AudioBitD4||AudioBitE4||AudioBitF4||AudioBitG4||AudioBitA5||AudioBitB5||AudioBitC5||AudioBitD5||AudioBitE5;
end
endmodule
