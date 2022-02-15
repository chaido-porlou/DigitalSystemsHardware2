module Decoder (input wire CLK, Reset, Type, En, H,
		output wire [0:7] LED, wire Q0, Q1, Q2, Q3);

wire Qn0, Qn1, Qn2, Qn3;

assign Qn0 = ~Q0;
assign Qn1 = ~Q1;
assign Qn2 = ~Q2;
assign Qn3 = ~Q3;

BCD DUT(.CLK(CLK), .Reset(Reset), .Q1(Q1), .Q2(Q2), .Q3(Q3), .Q0(Q0), .En(En));

assign A = ((Qn3 & Q1) | (Qn3 & Qn2 & Qn0) | (Qn3 & Q2 & Q0) | (Q3 & Qn2 & Qn1)) ^ Type;
assign B = ((Qn3 & Qn2) | (Qn2 & Qn1) | (Qn3 & Qn1 & Qn0) | (Qn3 & Q1 & Q0)) ^ Type;
assign C = ((Qn2 & Qn1) | (Qn3 & Q0) | (Qn3 & Q2)) ^ Type;
assign D = ((Qn3 & Qn2 & Qn0)| (Qn3 & Qn2 & Q1) | (Qn3 & Q1 & Qn0) | (Q3 & Qn2 & Qn1) | (Qn3 & Q2 & Qn1 & Q0)) ^ Type;
assign E = ((Qn2 & Qn1 & Qn0) | (Qn3 & Q1 & Qn0)) ^ Type;
assign F = ((Qn3 & Qn1 & Qn0) | (Qn3 & Q2 & Qn1)| (Qn3 & Q2 & Qn0) | (Q3 & Qn2 & Qn1)) ^ Type;
assign G = ((Qn3 & Qn2 & Q1) | (Qn3 & Q1 & Qn0) | (Qn3 & Q2 & Qn1) | (Q3 & Qn2 & Qn1)) ^ Type;

assign LED[0] = A;
assign LED[1] = B;
assign LED[2] = C;
assign LED[3] = D;
assign LED[4] = E;
assign LED[5] = F;
assign LED[6] = G;
assign LED[7] = H;


endmodule