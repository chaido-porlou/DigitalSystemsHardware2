`timescale 1ns/1ns

module FSM_a(output reg y_out,
             input wire x_in, CLK, Reset);

reg [2:0] CurrentState, NextState;
parameter s1 = 3'b001,
          s2 = 3'b011,
          s3 = 3'b100,
	  s4 = 3'b010,
	  s5 = 3'b000;

always @(posedge CLK or posedge Reset)
   begin
      if(Reset)
         CurrentState <= s1;
      else
         CurrentState <= NextState;
   end 

always @(CurrentState or x_in)
   begin
      case(CurrentState)
        s1 : if(x_in == 1'b0) NextState = s1;
                else NextState = s3;
        s2 : if(x_in == 1'b0) NextState = s1;
		else NextState = s4;
        s3 : if(x_in == 1'b0) NextState = s4;
		else NextState = s2;
	    s4 : if(x_in == 1'b0) NextState = s4;
		else NextState = s5;
	    s5 : if(x_in == 1'b0) NextState = s2;
		else NextState = s3;
        default : NextState = s1; 
      endcase 
   end 

always @(CurrentState or x_in)
   begin 
     case(CurrentState) 
        s1 : if(x_in == 1'b0) y_out = 1'b0;
                 else y_out = 1'b1;
        s2 : if(x_in == 1'b0) y_out = 1'b0;
                 else y_out = 1'b1;
        s3 : y_out = 1'b0;
	s4 : if(x_in == 1'b0) y_out = 1'b0;
                 else y_out = 1'b1;
	s5 : if(x_in == 1'b0) y_out = 1'b0;
                 else y_out = 1'b1;
        default : y_out = 1'b0;
      endcase
   end

endmodule 