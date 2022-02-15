`timescale 1ns/1ns

module BCD(input wire CLK, Reset, En,
	   output wire Q1, Q2, Q3, Q0);

wire Qn3, Qn2, Qn1, Qn0;
wire T3, T2, T1, T0;

Tflipflop DUT3 (.Q(Q3), .Qn(Qn3), .T(T3), .CLK(CLK), .Reset(Reset));
Tflipflop DUT2 (.Q(Q2), .Qn(Qn2), .T(T2), .CLK(CLK), .Reset(Reset));
Tflipflop DUT1 (.Q(Q1), .Qn(Qn1), .T(T1), .CLK(CLK), .Reset(Reset));
Tflipflop DUT0 (.Q(Q0), .Qn(Qn0), .T(T0), .CLK(CLK), .Reset(Reset));

assign T1 = Qn3 & Q0;
assign T2 = Qn3 & Q1 & Q0;
assign T0 = En;
assign T3 = (Qn3 & Q2 & Q1 & Q0) | (Q3 & Qn2 & Qn1 & Q0);

endmodule








