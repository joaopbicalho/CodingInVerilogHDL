
	
module part1(Clock, Enable, Clear_b, CounterValue);
input Clock, Enable, Clear_b;
output [7:0]CounterValue;
wire w1, w2, w3, w4, w5, w6, w7;
assign w1 = Enable & CounterValue[0];
assign w2 = w1 & CounterValue[1];
assign w3 = w2 & CounterValue[2];
assign w4 = w3 & CounterValue[3];
assign w5 = w4 & CounterValue[4];
assign w6 = w5 & CounterValue[5];
assign w7 = w6 & CounterValue[6];



tflipflop f1(.Clock(Clock), .Enable(Enable), .Clear_b(Clear_b), .Q(CounterValue[0]));
tflipflop f2(.Clock(Clock), .Enable(w1), .Clear_b(Clear_b), .Q(CounterValue[1]));
tflipflop f3(.Clock(Clock), .Enable(w2), .Clear_b(Clear_b), .Q(CounterValue[2]));
tflipflop f4(.Clock(Clock), .Enable(w3), .Clear_b(Clear_b), .Q(CounterValue[3]));
tflipflop f5(.Clock(Clock), .Enable(w4), .Clear_b(Clear_b), .Q(CounterValue[4]));
tflipflop f6(.Clock(Clock), .Enable(w5), .Clear_b(Clear_b), .Q(CounterValue[5]));
tflipflop f7(.Clock(Clock), .Enable(w6), .Clear_b(Clear_b), .Q(CounterValue[6]));
tflipflop f8(.Clock(Clock), .Enable(w7), .Clear_b(Clear_b), .Q(CounterValue[7]));



endmodule 

module tflipflop(Clock, Enable, Clear_b, Q);
input Clock, Enable, Clear_b;
output reg Q;


always @(posedge Clock, negedge Clear_b)
begin
	if(Clear_b == 1'b0)
		Q <= 1'b0;
	else 
	begin
		if(Enable == 1'b1)
			Q <= ~Q;
		else 
			Q <= Q;
		end
	end

endmodule 

module hex_decoder(NUM, HEX);
	input [3:0] NUM;
	output [6:0] HEX;
	
	h0_decoder h0(NUM[3], NUM[2], NUM[1], NUM[0], HEX[0]);
	h1_decoder h1(NUM[3], NUM[2], NUM[1], NUM[0], HEX[1]);
	h2_decoder h2(NUM[3], NUM[2], NUM[1], NUM[0], HEX[2]);
	h3_decoder h3(NUM[3], NUM[2], NUM[1], NUM[0], HEX[3]);
	h4_decoder h4(NUM[3], NUM[2], NUM[1], NUM[0], HEX[4]);
	h5_decoder h5(NUM[3], NUM[2], NUM[1], NUM[0], HEX[5]);
	h6_decoder h6(NUM[3], NUM[2], NUM[1], NUM[0], HEX[6]);
	
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
