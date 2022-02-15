`timescale 1ns/1ns

module Counter_TB;

   reg CLK_TB, Type; 
   reg Reset_TB, En;
   wire [0:7] LED1;
   wire [0:7] LED2;
   wire [0:7] LED3;
   wire [0:7] LED4;

   Decoder_4 DUT(.CLK(CLK_TB), .Reset(Reset_TB), .Type(Type), .En(En), .LED1(LED1[0:7]), .LED2(LED2[0:7]), .LED3(LED3[0:7]), .LED4(LED4[0:7]));

initial
   begin
      CLK_TB = 1'b1;
   end

initial 
   begin
      Reset_TB = 1;
   end

initial 
   begin
      Type = 1'b0;
   end

initial
   begin
      En = 1'b0;
   end

always 
   begin
     #1200 En = 1'b1;
  end

always 
   begin
     #5000 Reset_TB = 0;
  end
  
  

always 
   begin
     #500 CLK_TB = ~CLK_TB;
   end 

endmodule
