module FaConnect(SW, LEDR);
	input [9:0] SW;
	input [9:0] LEDR;
	
	adder(.a(SW[7:4]), .b(SW[3:0]), .c_in(SW[8]), .s(LEDR[3:0]), .c_out(LEDR[9]));
endmodule


module adder(a, b, c_in, s, c_out);
	
	input [3:0]a;
	input [3:0]b;
	input c_in;
	
	output [3:0]s;
	output c_out;
	
	
	
	wire c1, c2, c3;
	
		fullAdder(.a(a[0]), .b(b[0]), .c_in(c_in), .s(s[0]), .c_out(c1));
		fullAdder(.a(a[1]), .b(b[1]), .c_in(c1), .s(s[1]), .c_out(c2));
		fullAdder(.a(a[2]), .b(b[2]), .c_in(c2), .s(s[2]), .c_out(c3));
		fullAdder(.a(a[3]), .b(b[3]), .c_in(c3), .s(s[3]), .c_out(c_out));
	
endmodule

module fullAdder(a,b,c_in,s, c_out);
	input a,b,c_in;
	output s, c_out;
	 
	wire w1;
	
	assign w1 = a^b;
	assign s = c_in^w1;
	mux2to1(.x(b), .y(c_in), .s(w1), .m(c_out));
	
endmodule


module mux2to1(x, y, s, m);
    input x; //select 0
    input y; //select 1
    input s; //select signal
    output m; //output
  
    assign m = s & y | ~s & x;
endmodule
