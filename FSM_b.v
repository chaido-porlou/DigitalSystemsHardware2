module FSM_b(output wire y_out,
             input wire x_in, CLK, Reset);

wire D2, D1, D0;
wire Q2, Q1, Q0, Qn2, Qn1, Qn0;

dflipflop DUT2 (.Q(Q2), .Qn(Qn2), .CLK(CLK), .Reset(Reset), .D(D2), .R(0));
dflipflop DUT1 (.Q(Q1), .Qn(Qn1), .CLK(CLK), .Reset(Reset), .D(D1), .R(0));
dflipflop DUT0 (.Q(Q0), .Qn(Qn0), .CLK(CLK), .Reset(Reset), .D(D0), .R(1));

assign D2 = Qn2 & Qn1 & x_in;
assign D1 = (Qn2 & Qn0 & ~x_in) | (Q2 & Qn1 & Qn0) | (Qn2 & Q1 & Q0 & x_in) ;
assign D0 = (Qn2 & Qn1 & ~x_in) | (Qn2 & Q0 & ~x_in) | (Q2 & Qn1 & Qn0 & x_in); 

assign y_out = x_in & Qn2;

endmodule









