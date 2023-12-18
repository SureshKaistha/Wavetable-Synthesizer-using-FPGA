`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.12.2023 16:33:12
// Design Name: 
// Module Name: ClockGen
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


module ClockGen(
output [14:0] CLOCK_ARRAY ,
input CLK,
input enable
    );
//Messed up the note naming. A3 to A4 is actually A4 to A5
//A4 to A5 is actually A3 to A4 
Clock_divider #(.DIVISOR(18961)) 
                E2 (.clock_in(CLK), .enable(enable), .clock_out(CLOCK_ARRAY[0]));
                
Clock_divider #(.DIVISOR(17897)) 
                F2 (.clock_in(CLK), .enable(enable), .clock_out(CLOCK_ARRAY[1]));
                
Clock_divider #(.DIVISOR(15944)) 
                G2 (.clock_in(CLK), .enable(enable), .clock_out(CLOCK_ARRAY[2])); 
                   
Clock_divider #(.DIVISOR(14204)) 
                A3 (.clock_in(CLK), .enable(enable), .clock_out(CLOCK_ARRAY[3]));
                
Clock_divider #(.DIVISOR(12655)) 
                B3 (.clock_in(CLK), .enable(enable), .clock_out(CLOCK_ARRAY[4]));
                
Clock_divider #(.DIVISOR(11945)) 
                C3 (.clock_in(CLK), .enable(enable), .clock_out(CLOCK_ARRAY[5])); 
                
Clock_divider #(.DIVISOR(10641)) 
                D3 (.clock_in(CLK), .enable(enable), .clock_out(CLOCK_ARRAY[6]));
                
Clock_divider #(.DIVISOR(9480)) 
                E3 (.clock_in(CLK), .enable(enable), .clock_out(CLOCK_ARRAY[7]));   
                                                           
Clock_divider #(.DIVISOR(8948)) 
                F3 (.clock_in(CLK), .enable(enable), .clock_out(CLOCK_ARRAY[8]));
                
Clock_divider #(.DIVISOR(7972)) 
                G3 (.clock_in(CLK), .enable(enable), .clock_out(CLOCK_ARRAY[9]));
                
Clock_divider #(.DIVISOR(7102)) 
                A4 (.clock_in(CLK), .enable(enable), .clock_out(CLOCK_ARRAY[10])); 
              
Clock_divider #(.DIVISOR(6327)) 
                B4 (.clock_in(CLK), .enable(enable), .clock_out(CLOCK_ARRAY[11]));
                
Clock_divider #(.DIVISOR(5972)) 
                C4 (.clock_in(CLK), .enable(enable), .clock_out(CLOCK_ARRAY[12])); 

Clock_divider #(.DIVISOR(5321)) 
                D4 (.clock_in(CLK), .enable(enable), .clock_out(CLOCK_ARRAY[13]));
                
Clock_divider #(.DIVISOR(4740)) 
                E4 (.clock_in(CLK), .enable(enable), .clock_out(CLOCK_ARRAY[14])); 
              

endmodule
