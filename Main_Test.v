`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.12.2023 11:49:55
// Design Name: 
// Module Name: Main_Test
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


module Main_Test(
    input CLK,
    input [3:0] A,
    output COUT,
    output AUDIO
    );
reg AUDIO1;
reg enable=1;
wire sound1;
wire sound2;    
wire clk_low;
reg sound3=0;

Clock_divider #(.DIVISOR(10)) 
                div111 (.clock_in(CLK), .enable(enable), .clock_out(clk_low));
                
Clock_divider #(.DIVISOR(10)) 
                div1 (.clock_in(CLK), .enable(A[0]), .clock_out(sound1));
                
                
Clock_divider #(.DIVISOR(5)) 
                div3 (.clock_in(CLK), .enable(A[1]), .clock_out(sound2));     
   
 Clock_divider #(.DIVISOR(10000000)) 
                div2 (.clock_in(CLK), .enable(A[2]), .clock_out(COUT));               
  
always @(posedge CLK)
begin
AUDIO1<=sound1||sound2||sound3;
end   
assign AUDIO=AUDIO1;            
reg [1:0]count =0;  


always @(posedge clk_low)
begin
if (A[3]) begin
if (count!='b11) begin
    count<=count+'b1;
    sound3<=1;
    end
else 
begin
    count<=0;
    sound3<=0;
end
end
end
endmodule
