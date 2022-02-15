module Decoder_4 (input wire CLK, Reset, Type, En,
		  output wire [0:7] LED1, [0:7] LED2, [0:7] LED3, [0:7] LED4);

Decoder DUT0 (.CLK(CLK), .Reset(Reset), .Type(Type), .En(En), .H(1'b0), .LED(LED4), .Q0(Q0_0), .Q1(Q1_0), .Q2(Q2_0), .Q3(Q3_0));

Decoder DUT1 (.CLK(~(Q0_0 | Q1_0 | Q2_0 | Q3_0)), .Reset(Reset), .Type(Type), .En(En), .H(1'b0), .LED(LED3), .Q0(Q0_1), .Q1(Q1_1), .Q2(Q2_1), .Q3(Q3_1));

Decoder DUT2 (.CLK(~(Q0_1 | Q1_1 | Q2_1 | Q3_1)), .Reset(Reset), .Type(Type), .En(En), .H(1'b0), .LED(LED2), .Q0(Q0_2), .Q1(Q1_2), .Q2(Q2_2), .Q3(Q3_2));

Decoder DUT3 (.CLK(~(Q0_2 | Q1_2 | Q2_2 | Q3_2)), .Reset(Reset), .Type(Type), .En(En), .H(1'b1), .LED(LED1), .Q0(Q0_3), .Q1(Q1_3), .Q2(Q2_3), .Q3(Q3_3));



endmodule
