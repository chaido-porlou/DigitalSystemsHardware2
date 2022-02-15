`timescale 1ns/1ns

module FSM_testbench_c;

   reg CLK_TB;
   reg Reset_TB;
   reg x_in_TB;
   wire y_out_TB;

   integer i;
   reg Expected_y_out;
   reg [0:2] TestVector [0:18];

   FSM_c DUT(.CLK(CLK_TB),.Reset(Reset_TB),.x_in(x_in_TB),.y_out(y_out_TB));

initial
   begin
      CLK_TB = 1'b1;
   end

initial 
   begin
      $readmemb("TestVector1a.txt",TestVector);
      i = 0;
      Reset_TB = 1;
      x_in_TB = 0;
   end

always 
   begin
     #5 CLK_TB = ~CLK_TB;
   end 

always @(posedge CLK_TB)
   begin
      {Reset_TB,x_in_TB,Expected_y_out} = TestVector[i]; #5
      $display(Reset_TB,x_in_TB,Expected_y_out);
   end

always@(negedge CLK_TB)
   begin
      if(Expected_y_out !== y_out_TB) begin
          $display("Wrong output for inputs %b, %b != %b",{Reset_TB,x_in_TB},Expected_y_out,y_out_TB);
      end
      i = i + 1;
   end 

endmodule