module part3(ClockIn, Resetn, Start, Letter, DotDashOut);
	input [2:0] Letter;
	input Resetn, Start, ClockIn;
	output DotDashOut;
	reg [11:0] let;
	
	always @(*) // declare always block
	begin
	case (Letter[2:0]) // start case statement
		3'b000: let = 12'b010111000000; // case 0
		3'b001: let = 12'b011101010100; // case 1
		3'b010: let = 12'b011101011101; // case 2
		3'b011: let = 12'b011101010000; // case 3
		3'b100: let = 12'b010000000000; // case 4
		3'b101: let = 12'b010101110100; // case 5
		3'b110: let = 12'b011101110100; // case 6
		3'b111: let = 12'b010101010000; // case 7
		default: let = 12'b010111000000; // default display letter "A"
	endcase
	end
	
	wire Enable;
	RD rd1(ClockIn, Enable, Resetn);
	wire [11:0] shiftedOut;
	reg rotateLeft;
	always @(posedge ClockIn, negedge Resetn)
	begin 
		if(Resetn == 1'b0)
			rotateLeft <= 1'b0;
		else if(Enable == 1'b1)
			rotateLeft <= 1'b1;
		else
			rotateLeft <= 1'b0;
	end
	shiftReg shift(ClockIn, ~Resetn, ~Start, ~rotateLeft, 1'b0, let, shiftedOut, Enable);
	assign DotDashOut = shiftedOut[11];

endmodule

module shiftReg(clock, reset, ParallelLoadn, RotateRight, ASRight, Data_IN, Q, Enable);
	input [11:0] Data_IN;
	output [11:0] Q;
	input clock, reset, ParallelLoadn, RotateRight, ASRight, Enable;
	wire Wasr;//for wiring ASRight output
	
	
	
	dff_mx sub11(Data_IN[11], ParallelLoadn, RotateRight, Q[10], Q[11], reset, clock, Q[11]);
	dff_mx sub10(Data_IN[10], ParallelLoadn, RotateRight, Q[9], Q[10], reset, clock, Q[10]);
	dff_mx sub9(Data_IN[9], ParallelLoadn, RotateRight, Q[8], Q[9], reset, clock, Q[9]);
	dff_mx sub8(Data_IN[8], ParallelLoadn, RotateRight, Q[7], Q[8], reset, clock, Q[8]);
	dff_mx sub7(Data_IN[7], ParallelLoadn, RotateRight, Q[6], Q[7], reset, clock, Q[7]);
	dff_mx sub6(Data_IN[6], ParallelLoadn, RotateRight, Q[5], Q[6], reset, clock, Q[6]);
	dff_mx sub5(Data_IN[5], ParallelLoadn, RotateRight, Q[4], Q[5], reset, clock, Q[5]);
	dff_mx sub4(Data_IN[4], ParallelLoadn, RotateRight, Q[3], Q[4], reset, clock, Q[4]);
	dff_mx sub3(Data_IN[3], ParallelLoadn, RotateRight, Q[2], Q[3], reset, clock, Q[3]);
	dff_mx sub2(Data_IN[2], ParallelLoadn, RotateRight, Q[1], Q[2], reset, clock, Q[2]);
	dff_mx sub1(Data_IN[1], ParallelLoadn, RotateRight, Q[0], Q[1], reset, clock, Q[1]);
	dff_mx sub0(Data_IN[0], ParallelLoadn, RotateRight, Q[11], Q[0], reset, clock, Q[0]);
	

endmodule


module dff_mx(D, loadn, LoadLeft, right, left, resetn, clk, Q);
	input D, loadn, LoadLeft, right, left, resetn, clk;
	output Q;
	wire w1, w2; 
	
	mux2to1 M1(right, left, LoadLeft, w1);
	mux2to1 M2(D, w1,loadn, w2);
	dff ff0(w2, clk, resetn, Q);
	
	

endmodule


module dff(d, clk, resetn, q); 
	input d,clk,resetn;
	output reg q;
	always @(posedge clk, negedge resetn)
		begin
			if(resetn == 1'b1)
				q <= 0;
			else
				q <= d;
		end
endmodule 

module mux2to1(x, y, s, m);
    input x; 
    input y; 
    input s; 
    output m; 
  
    
    assign m = s ? y : x;

endmodule

module RD(ClockIn, enable, reset); 
	input ClockIn, reset;
	output reg enable;
	reg [10:0]countDown;
	always @(posedge ClockIn, negedge reset)
	begin
		if(reset == 1'b0)
			begin enable <= 1'b0; countDown <= 11'b00011111001; end
		else if(enable == 1'b1)
			begin enable <= ~enable; countDown <= 11'b00011111001; end 
		else if(countDown == 11'b00000000001)
			enable <= 1'b1;
		else 
			countDown <= countDown-1;
	end
endmodule 
