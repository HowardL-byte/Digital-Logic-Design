module Lab3(
input [9:0] SWITCHES,    //Inputs from the switches
output [6:0] DISP_A,     //LED display for input_x
output [6:0] DISP_B,     //LED display for input_y
output [6:0] DISP_SIGN,  //LED display for sign and carry
output [6:0] DISP_OUT    //Display for result
);
wire [3:0] input_x = SWITCHES[3:0]; // Bits 0 to 3 assigned to input_x
wire [3:0] input_y = SWITCHES[7:4]; // Bits 4 to 7 assigned to input_y
wire operation = SWITCHES[8];       // Bit 8 used to indicate addition or subtraction
wire [3:0] final_result;
wire carry_out;

// Instantiate adder/subtractor module for input_x, input_y, final_result, and carry_out
four_bit_adder_subtractor adder_subtractor_instance (
.input_x(input_x),
.input_y(input_y),
.operation(operation),
.final_result(final_result),
.carry_out(carry_out)
);

// Instantiate seven-segment decoder for input_x, output to DISP_A
seven_segment_decoder seg_decoder_x (
.in(input_x),
.out(DISP_A)
);

// Instantiate seven-segment decoder for input_y, output to DISP_B
seven_segment_decoder seg_decoder_y (
.in(input_y),
.out(DISP_B)
);

reg [6:0] disp_sign_value;
reg [3:0] disp_out_value;

always @(*) begin
if (operation == 0) begin // Perform addition
    disp_out_value = final_result;
    if (carry_out == 1)
        disp_sign_value = 7'b1111001; // If addition and carry is 1, display '1' on DISP_SIGN
    else
        disp_sign_value = 7'b1111111; // If addition and carry is 0, turn off DISP_SIGN
end else begin
    if (carry_out == 1) begin
        disp_sign_value = 7'b1111111; // If subtraction and result is positive, turn off DISP_SIGN
        disp_out_value = final_result; // Display result
    end else begin
        disp_sign_value = 7'b0111111; // If subtraction and result is negative, display '-' on DISP_SIGN
        disp_out_value = ~final_result + 1; // Take two's complement of result for negative output
    end
end
end

// Instantiate seven-segment decoder for result, output to DISP_OUT
seven_segment_decoder seg_decoder_result (
.in(disp_out_value),
.out(DISP_OUT)
);

// Directly assign disp_sign_value to DISP_SIGN
assign DISP_SIGN = disp_sign_value;
endmodule

