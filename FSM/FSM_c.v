module FSM_c(output wire y_out,
             input wire x_in, CLK, Reset);
			 
wire J2, J1, J0, K2, K1, K0;
wire Q2, Q1, Q0, Qn2, Qn1, Qn0;

jkflipflop DUT2 (.Q(Q2), .Qn(Qn2), .J(J2), . K(K2), .CLK(CLK), .Reset(Reset), .R(0));
jkflipflop DUT1 (.Q(Q1), .Qn(Qn1), .J(J1), . K(K1), .CLK(CLK), .Reset(Reset), .R(0));
jkflipflop DUT0 (.Q(Q0), .Qn(Qn0), .J(J0), . K(K0), .CLK(CLK), .Reset(Reset), .R(1));

assign J2 = Qn2 & Qn1 & x_in;
assign K2 = 1'b1;

assign J1 = (Qn1 & Qn0 & ~x_in) | (Q2 & Qn1 & Qn0);
assign K1 = (Qn2 & Qn0 & x_in) | (Qn2 & Q0 & ~x_in);

assign J0 = (Qn2 & Qn1 & ~x_in) | (Q2 & Qn1 & Qn0 & x_in);
assign K0 = Qn2 & x_in;

assign y_out = x_in & Qn2;

endmodule

