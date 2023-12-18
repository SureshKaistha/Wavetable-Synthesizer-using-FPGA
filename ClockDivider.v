`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.11.2023 13:59:04
// Design Name: 
// Module Name: Clock_divider
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


module Clock_divider(
clock_in,
enable,
clock_out
    );
    input clock_in; // input clock on FPGA
    input  enable;
output reg clock_out; // output clock after dividing the input clock by divisor
reg[27:0] counter=28'd0;
parameter DIVISOR = 10000000;
// The frequency of the output clk_out
// = The frequency of the input clk_in divided by DIVISOR
// For example: Fclk_in = 50Mhz, if you want to get 1Hz signal to blink LEDs
// You will modify the DIVISOR parameter value to 28'd50.000.000
// Then the frequency of the output clk_out = 50Mhz/50.000.000 = 1Hz

always @(posedge clock_in)
begin
if (enable)
begin
    counter <= counter + 28'd1;
    if(counter>=(DIVISOR-1))
    counter <= 28'd0;
    clock_out <= (counter<DIVISOR/2)?1'b1:1'b0;
end
else begin
    clock_out <='b0;
end
end



endmodule
