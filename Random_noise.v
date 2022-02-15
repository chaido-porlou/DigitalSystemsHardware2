module Random_noise (input wire [0:16] word, wire Reset,
		     output reg [0:16] error_word);
integer position;
integer error;

always @(word or posedge Reset)
 begin
  error_word = word;

  position = $urandom_range(0,16);
  error = $urandom_range(0,1);
  if (error == 1)
   begin
    error_word[position] = ~error_word[position];
   end
 end

endmodule