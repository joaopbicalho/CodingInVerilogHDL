`timescale 1ns / 1ns
module lab3part3(SW, KEY, LEDR, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);
	input [9:0] SW;
	input [2:0]KEY;
	output [9:0]LEDR;
	output [6:0]HEX0;
	output [6:0]HEX1;
	output [6:0]HEX2;
	output [6:0]HEX3;
	output [6:0]HEX4;
	output [6:0]HEX5;

	wire [7:0] ALUout;
	
	
	part3 u1(.A(SW[7:4]), .B(SW[3:0]), .Function(KEY[2:0]), .ALUout(ALUout[7:0]));
	assign LEDR[7:0] = ALUout[7:0]
	
	hex_decoder h0(.NUM(SW[3:0]), .HEX(HEX0));
	hex_decoder h2(.NUM(SW[7:4]), .HEX(HEX2));
	hex_decoder h1(.NUM(4'b0000), .HEX(HEX1));
	hex_decoder h3(.NUM(4'b0000), .HEX(HEX3));
	hex_decoder h4(.NUM(ALUout[3:0]), .HEX(HEX4));
	hex_decoder h5(.NUM(ALUout[7:4]), .HEX(HEX5));	

endmodule





module part3(A, B, Function, ALUout);
	input [3:0] A;
	input [3:0] B;
	input [2:0] Function;
	output reg[7:0]ALUout;
	wire [3:0] s;
	wire c_out;
	
	threeBitAdder u1(.a(A), .b(B), .c_in(1'b0), .s(s[3:0]), .c_out(c_out));
	
	always @(*)
	begin
		case(Function[2:0])
			3'b000: ALUout = {3'b000, c_out, s};
			3'b001: ALUout = A + B;
			3'b010: ALUout = B[3]?{3'b1111, B}:{3'b0000, B};
			3'b011: ALUout = |({A,B});
			3'b100: ALUout = &({A,B});
			3'b101: ALUout = {A, B};	
			default: ALUout = 8'b00000000;
		endcase
	end	
endmodule


module threeBitAdder(a, b, c_in, s, c_out);
	
	input [3:0]a;
	input [3:0]b;
	input c_in;
	
	output [3:0]s;
	output c_out;
	
	
	
	wire c1, c2, c3;
	
		fullAdder f1(.a(a[0]), .b(b[0]), .c_in(c_in), .s(s[0]), .c_out(c1));
		fullAdder f2(.a(a[1]), .b(b[1]), .c_in(c1), .s(s[1]), .c_out(c2));
		fullAdder f3(.a(a[2]), .b(b[2]), .c_in(c2), .s(s[2]), .c_out(c3));
		fullAdder f4(.a(a[3]), .b(b[3]), .c_in(c3), .s(s[3]), .c_out(c_out));
	
endmodule

module fullAdder(a,b,c_in,s, c_out);
	input a,b,c_in;
	output s, c_out;
	 
	wire w1;
	
	assign w1 = a^b;
	assign s = c_in^w1;
	assign c_out = (w1 & c_in)|(a&b);
	
endmodule

module hex_decoder(NUM, HEX);
	input [3:0] NUM;
	output [6:0] HEX;
	
	h0_decoder(NUM[3], NUM[2], NUM[1], NUM[0], HEX[0]);
	h1_decoder(NUM[3], NUM[2], NUM[1], NUM[0], HEX[1]);
	h2_decoder(NUM[3], NUM[2], NUM[1], NUM[0], HEX[2]);
	h3_decoder(NUM[3], NUM[2], NUM[1], NUM[0], HEX[3]);
	h4_decoder(NUM[3], NUM[2], NUM[1], NUM[0], HEX[4]);
	h5_decoder(NUM[3], NUM[2], NUM[1], NUM[0], HEX[5]);
	h6_decoder(NUM[3], NUM[2], NUM[1], NUM[0], HEX[6]);
	
endmodule



module h0_decoder(c0,c1,c2,c3,out);
	input c0,c1,c2,c3;
	output out;
	
	assign out = ~((~c1 & ~c3) | (~c0 & c2) | (~c0 & c1 & c3) | (c1 & c2) | (c0 & ~c1 & ~c2) | (c0 & ~c3));
	
endmodule

module h1_decoder(c0,c1,c2,c3,out);
	input c0,c1,c2,c3;
	output out;
	
	assign out = ~((~c0 & ~c1) | (~c0 & ~c2 & ~c3) | (~c1 & ~c3) | (~c0 & c2 & c3) | (c0 & c3 & ~c2));
	
endmodule

module h2_decoder(c0,c1,c2,c3,out);
	input c0,c1,c2,c3;
	output out;
	
	assign out = ~((~c0 & ~c2) | (~c0 & c3) | (~c2 & c3) | (~c0 & c1) | (c0 & ~c1));
	
endmodule

module h3_decoder(c0,c1,c2,c3,out);
	input c0,c1,c2,c3;
	output out;
	
	assign out = ~((~c0 & ~c1 & ~c3) | (~c1 & c2 & c3) | (c1 & ~c2 & c3) | (c1 & c2 & ~c3) | (c0 & ~c2 & ~c3));
	
endmodule

module h4_decoder(c0,c1,c2,c3,out);
	input c0,c1,c2,c3;
	output out;
	
	assign out = ~((~c1 & ~c3) | (c2 & ~c3) | (c0 & c2) | (c0 & c1));
	
endmodule

module h5_decoder(c0,c1,c2,c3,out);
	input c0,c1,c2,c3;
	output out;
	
	assign out = ~((~c2 & ~c3) | (~c0 & c1 & ~c2) | (c1 & ~c3) | (c0 & ~c1) | (c0 & c2));
	
endmodule

module h6_decoder(c0,c1,c2,c3,out);
	input c0,c1,c2,c3;
	output out;
	
	assign out = ~((~c1 & c2) | (c2 & ~c3) | (~c0 & c1 & ~c2) | (c0 & ~c1) | (c0 & c3));
	
endmodule




