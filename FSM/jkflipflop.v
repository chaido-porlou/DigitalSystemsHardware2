module jkflipflop (output reg Q, Qn,
		   input wire J, K, CLK, Reset, R);  
  
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
      case ({J,K})  
         2'b00 :  begin
		   Q <= Q;  
		   Qn <= ~Q;
		  end
         2'b01 :  begin
		   Q <= 1'b0;  
		   Qn <= 1'b1;
		  end
         2'b10 :  begin
		   Q <= 1'b1; 
		   Qn <= 1'b0;
		  end
         2'b11 :  begin
		   Q <= ~Q;
		   Qn <= Q;
		  end
      endcase  
    end
endmodule  