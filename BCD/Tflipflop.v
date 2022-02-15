module Tflipflop (output reg Q, Qn,
		  input wire CLK, T, Reset);

always @ (posedge CLK or posedge Reset)
begin
if (Reset)  
 begin
   Q <= 1'b0;
   Qn <= 1'b1;
  end

if (T == 0 && Reset == 0)
  begin
   Q <= Q;
   Qn <= Qn;
  end

if (T == 1 && Reset ==0)
  begin
   Q <= Qn;
   Qn <= Q;
  end
end

//structural
//assign Q = ~((Q & T & CLK) | Qn);
//assign Qn = ~((T & CLK & Qn) | Q);

endmodule

