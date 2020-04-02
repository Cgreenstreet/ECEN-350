module RegisterFile(BusA, BusB, BusW, RA, RB, RW, RegWr, Clk);
	output [63:0] BusA;
	output [63:0] BusB;
	input [63:0] BusW;
	input [4:0] RA;
	input [4:0] RB;
	input [4:0] RW;
	input RegWr;
	input Clk;

	reg [63:0] register [31:0]; // 64, 32-bit registers

	


	integer i;
	initial begin
		for(i = 0; i<32; i = i + 1)begin
			register[i] <= 0; // clear registers to 0;
		end
	end
	

	always@(negedge Clk) begin
		register[31] <= 0; // register 31 is always 0
	
	if(RegWr)begin
		if(RW != 31)begin
			register[RW] <= BusW;
		end
	end
	
	end
	assign BusA = register[RA]; // RA indices the registers value on BusA
	assign BusB = register[RB]; // RB indices the registers value on BusB
endmodule
		
