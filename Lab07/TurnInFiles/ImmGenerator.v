module ImmGenerator(Imm64, Imm26, Ctrl);
   output reg [63:0] Imm64;
   input [25:0]  Imm26;
   input [1:0]	 Ctrl;


   wire 	 extBit;

   //assign extBit = (Ctrl ? 1'b0 : Imm32[31]);
   //assign Imm32 = {{32{extBit}}, Imm32};

   
   always@(*)
     begin
        if(Ctrl[1:0] == 2'b00) begin  // I-type
	   Imm64 = {52'b0,Imm26[21:10]};
        end
        if(Ctrl[1:0] == 2'b01)begin // Load/Store
           Imm64 = {{55{Imm26[20]}}, Imm26[20:12]};
	end
	if(Ctrl[1:0] == 2'b10)begin // Uncond. Branch
          Imm64 = {{38{Imm26[25]}}, Imm26[25:0]};
	end
	if(Ctrl[1:0] == 2'b11)begin // Cond. Branch
	  Imm64 = {{45{Imm26[23]}}, Imm26[23:5]};
	end
      end
   endmodule
