module full_adder(
	input wire a_in,
	input wire b_in,
	input wire c_in,
	output wire sum_out,
	output wire c_out
);

assign {c_out,sum_out} = a_in + b_in + c_in;

endmodule
