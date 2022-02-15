`timescale 1ns/1ns
module Hamming_TB;

reg CLK_TB;

reg [0:11]in_TB;
integer i;
reg [0:13] TestVector [0:6];
 
wire [0:16] out_TB;
wire [0:16] error_word;
wire [0:11] correct_word_TB;
reg Reset_TB;

Hamming_encoder DUT1 (.in(in_TB[0:11]), .out(out_TB[0:16]), .Reset(Reset_TB));
Random_noise DUT2 (.word(out_TB[0:16]), .error_word(error_word[0:16]), .Reset(Reset_TB));
Hamming_decoder DUT3 (.error_word(error_word[0:16]), .Reset(Reset_TB), .correct_word(correct_word_TB[0:11]));

initial 
   begin
      Reset_TB = 1;
   end

initial
   begin
      CLK_TB = 1'b1;
   end

initial 
   begin
      $readmemb("TestVector3.txt",TestVector);
      i = 0;
   end

always 
   begin
     #5 CLK_TB = ~CLK_TB;
   end 

always @(posedge CLK_TB)
   begin
      {Reset_TB, in_TB} = TestVector[i]; #5
       $display(in_TB);
       $display(correct_word_TB);
   end

always@(negedge CLK_TB)
   begin
      if(in_TB == correct_word_TB) begin
          $display("Correct output for inputs %b = %b",in_TB,correct_word_TB);
      end
      i = i + 1;
   end 

endmodule
