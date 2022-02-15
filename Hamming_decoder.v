module Hamming_decoder (input wire [0:16] error_word, wire Reset,
		        output reg [0:11] correct_word);

reg par1, par2, par4, par8, par16;
reg [0:4] par;
reg [0:16] middle_word;
integer i,j;

always @(error_word or posedge Reset)
 begin
  if (Reset)
   begin
    correct_word = 0;
   end
  else
   begin 

    par1 = ^(error_word & 17'b10101010101010101);
    par2 = ^(error_word & 17'b01100110011001100);
    par4 = ^(error_word & 17'b00011110000111100);
    par8 = ^(error_word & 17'b00000001111111100);
    par16 = ^(error_word & 17'b00000000000000011);
    par = {par16, par8, par4, par2, par1};

    middle_word = error_word;
    middle_word[par-1] = ~middle_word[par-1]; //correction in place
    i = 0;
    j = 0;

    while (i < 12 || j < 17)
     begin
      while (j==0 || j==1 || j==3 || j==7 || j==15)
       begin
	j = j + 1;
       end
      correct_word[i] = middle_word[j];
      j = j + 1;
      i = i + 1;
     end
   end
  end

endmodule


