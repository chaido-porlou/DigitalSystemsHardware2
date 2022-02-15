module dflipflop (output reg Q, Qn,
		  input wire CLK, Reset, D, R);
  
  always @ (posedge CLK or posedge Reset)
   if (Reset)
     if (R == 1)
      begin
	 Q <= 1'b1;
	 Qn <= 1'b0;
       end
     else
      begin
	 Q <= 1'b0;
	 Qn <= 1'b1;
      end
   else
    begin
	Q <= D;
	Qn <= ~D;
    end

endmodule