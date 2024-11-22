// Full adder module
module full_adder(
input A,
input B,
input Cin,
output Sum,
output Cout
);
assign Sum = A ^ B ^ Cin; // Compute sum of A + B + Cin
assign Cout = (A & B) | (B & Cin) | (A & Cin); // Compute carry-out
endmodule