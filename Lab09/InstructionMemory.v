`timescale 1ns / 1ps
/*
 * Module: InstructionMemory
 *
 * Implements read-only instruction memory
 *
 */
module InstructionMemory(Data, Address);
    output [31:0] Data;
    input [63:0]  Address;
    reg [31:0] 	 Data;

    /*
    * ECEN 350 Processor Test Functions
    * Texas A&M University
    */

    always @ (Address) begin
        case(Address)
        /* Test Program 1:
         * Program loads constants from the data memory. Uses these constants to test
         * the following instructions: LDUR, ORR, AND, CBZ, ADD, SUB, STUR and B.
         *
         * Assembly code for test:
         *
         * 0x00: ORR  X20, XZR, XZR     //Create a base memory address
         * 0x04: LDUR X9,  [X20, 0x0]   //Load 1 into x9
         * 0x08: LDUR X10, [X20, 0x8]   //Load a into x10
         * 0x0c: LDUR X11, [X20, 0x10]  //Load 5 into x11
         * 0x10: LDUR X12, [X20, 0x18]  //Load big constant into x12
         * 0x14: LDUR X13, [X20, 0x20]  //load a 0 into X13
         *
         * 0x18: ORR X10, X10, X11  //Create mask of 0xf
         * 0x1c: AND X12, X12, X10  //Mask off low order bits of big constant
         *
         * loop:
         * 0x20: CBZ X12, end  //while X12 is not 0
         * 0x24: ADD X13, X13, X9  //Increment counter in X13
         * 0x28: SUB X12, X12, X9  //Decrement remainder of big constant in X12
         * 0x2c: B loop  //Repeat till X12 is 0
         * 0x30: STUR X13, [X20, 0x20]  //store back the counter value into the memory location 0x20
         * 0x34: LDUR X13, [X20, 0x20]  //One last load to place stored value on memdbus for test checking.
         */

        64'h000: Data = 32'hAA1F03F4;
        64'h004: Data = 32'hF8400289;
        64'h008: Data = 32'hF840828A;
        64'h00c: Data = 32'hF841028B;
        64'h010: Data = 32'hF841828C;
        64'h014: Data = 32'hF842028D;
        64'h018: Data = 32'hAA0B014A;
        64'h01c: Data = 32'h8A0A018C;
        64'h020: Data = 32'hB400008C;
        64'h024: Data = 32'h8B0901AD;
        64'h028: Data = 32'hCB09018C;
        64'h02c: Data = 32'h17FFFFFD;
        64'h030: Data = 32'hF802028D;
        64'h034: Data = 32'hF842028D;


        /* Add code for your tests here 
	* 0x38: MOVZ X9, #0xdef0 // LSL 0
	* 0x3C: MOVZ X10, #0x9abc // LSL 16
	* 0x40: ORR X11, X9, X10 // X11 = 0x000009abcdef0
	* 0x44: MOVZ X9, #0x5678 // LSL 32
	* 0x48: MOVZ X10, #0x1234 // LSL 48
	* 0x4C: ORR X12, X9, X19 // X12 = 0x1234567800000000
	* 0x50: ORR X9, X11, X12 // X9 = 0x123456789abcdef0
	* 0x54: ADD X0, XZR, XZR // X0 = 0
	* 0x58: STUR X9, [X0, #0x28] // X9->X0
	* 0x5C: LDUR X10, [X9, #0x28] // X10 = X9	
	*/

	64'h038: Data = 32'hD29BDE09;
        64'h03c: Data = 32'hD2B3578A;
        64'h040: Data = 32'hAA09014B;
        64'h044: Data = 32'hD2CACF09;
        64'h048: Data = 32'hD2E2468A;
        64'h04c: Data = 32'hAA09014A;
        64'h050: Data = 32'hAA0B0189;
        64'h054: Data = 32'h8B1F03E0;
        64'h058: Data = 32'hF8028009;
        64'h05c: Data = 32'hF842800A;
        
	


        default: Data = 32'hXXXXXXXX;
        endcase
    end
endmodule

