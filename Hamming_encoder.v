module Hamming_encoder (input wire [0:11] in, reg Reset,
			output reg [0:16] out);
integer i, j;

always @(in or posedge Reset)
 begin
  if (Reset)
   begin
    out = 0;
   end
  else
   begin
    i = 0;
    j = 0;
    while (i < 12 || j < 17)
     begin
      while (j==0 || j==1 || j==3 || j==7 || j==15)
       begin
	out[j] = 0;
	j = j + 1;
       end
      out[j] = in[i];
      j = j + 1;
      i = i + 1;
     end
     if (^(out & 17'b10101010101010101))
      out[0] = ~out[0];
     if (^(out & 17'b01100110011001100))
      out[1] = ~out[1];
     if (^(out & 17'b00011110000111100))
      out[3] = ~out[3];
     if (^(out & 17'b00000001111111100))
      out[7] = ~out[7];
     if (^(out & 17'b00000000000000011))
      out[15] = ~out[15];
    end
  end
endmodule
