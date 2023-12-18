`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.12.2023 16:18:43
// Design Name: 
// Module Name: Note
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


module Note(
output AudioBit,
input CLK,
input [2:0] TableSelect,
input Press,
input Record,
input [31:0] Rec_WT
    );
    
    reg [31:0] Wavetable;
always@(posedge CLK)
begin    
    if(Record==0) begin
    case (TableSelect)
        'b0 : Wavetable= 'b11111111_00000000_11111111_00000000;
        'b01 : Wavetable='b11110000_00000000_11110000_00000000;
        'b10 : Wavetable='b11110000_00000000_00000000_11110000;
        'b11 : Wavetable='b00010011_01110111_11101110_11001000;
        'b100: Wavetable='b00001010_01010010_10101011_11010101;
        'b101 : Wavetable='b10100000011100001011100001110111;
        'b110 : Wavetable='b01010100000011100011011010001111;
        'b111 : Wavetable='b11010001100100110001010000101100;
        default: Wavetable='bx;
    endcase
    end
    else begin
        Wavetable=Rec_WT;
    end
 end 
 Wavetable_Synth synthesizer(AudioBit,CLK,Wavetable,Press);
endmodule
