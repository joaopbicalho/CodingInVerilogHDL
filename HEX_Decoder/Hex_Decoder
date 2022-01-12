`timescale 1ns / 1ps

module lab2part3(SW, HEX0);
	input [9:0] SW;
	output [6:0] HEX0;
	
	h0_decoder(SW[0], SW[1], SW[2], SW[3], HEX0[0]);
	h1_decoder(SW[0], SW[1], SW[2], SW[3], HEX0[1]);
	h2_decoder(SW[0], SW[1], SW[2], SW[3], HEX0[2]);
	h3_decoder(SW[0], SW[1], SW[2], SW[3], HEX0[3]);
	h4_decoder(SW[0], SW[1], SW[2], SW[3], HEX0[4]);
	h5_decoder(SW[0], SW[1], SW[2], SW[3], HEX0[5]);
	h6_decoder(SW[0], SW[1], SW[2], SW[3], HEX0[6]);
	
endmodule


module hex_decoder(c, display);
	input [3:0]c;
	output [6:0]display;
	
	h0_decoder u0 (
	.c0(c[3]),
	.c1(c[2]),
	.c2(c[1]),
	.c3(c[0]),
	.out(display[0])
	);
	h1_decoder u1(
	.c0(c[3]),
	.c1(c[2]),
	.c2(c[1]),
	.c3(c[0]),
	.out(display[1])
	);
	h2_decoder u2(
	.c0(c[3]),
	.c1(c[2]),
	.c2(c[1]),
	.c3(c[0]),
	.out(display[2])
	);
	h3_decoder u3(
	.c0(c[3]),
	.c1(c[2]),
	.c2(c[1]),
	.c3(c[0]),
	.out(display[3])
	);
	h4_decoder u4(
	.c0(c[3]),
	.c1(c[2]),
	.c2(c[1]),
	.c3(c[0]),
	.out(display[4])
	);
	h5_decoder u5(
	.c0(c[3]),
	.c1(c[2]),
	.c2(c[1]),
	.c3(c[0]),
	.out(display[5])
	);
	h6_decoder u6(
	.c0(c[3]),
	.c1(c[2]),
	.c2(c[1]),
	.c3(c[0]),
	.out(display[6])
	);
	
	
	

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




