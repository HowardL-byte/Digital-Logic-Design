// Module for four-bit adder/subtractor
module four_bit_adder_subtractor(
input [3:0] input_x,
input [3:0] input_y,
input operation,
output [3:0] final_result,
output carry_out
);
wire carry1, carry2, carry3;
wire [3:0] mod_input_y;
assign mod_input_y = input_y ^ {4{operation}};

// Instantiate four full adders for four bits
full_adder FA0 ( 
.A(input_x[0]),
.B(mod_input_y[0]),
.Cin(operation),
.Sum(final_result[0]),
.Cout(carry1)
);
full_adder FA1 (
.A(input_x[1]),
.B(mod_input_y[1]),
.Cin(carry1),
.Sum(final_result[1]),
.Cout(carry2)
);
full_adder FA2 (
.A(input_x[2]),
.B(mod_input_y[2]),
.Cin(carry2),
.Sum(final_result[2]),
.Cout(carry3)
);
full_adder FA3 (
.A(input_x[3]),
.B(mod_input_y[3]),
.Cin(carry3),
.Sum(final_result[3]),
.Cout(carry_out)
);
endmodule