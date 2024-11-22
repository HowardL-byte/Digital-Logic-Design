//Name:Hao Liu, YouWei Qin
//Student #:218703991, 219690858

module lab4(
  clk, rst, pause, sw, Hex0, Hex1
);

input clk;
input rst;
input pause;
input sw;

output [6:0] Hex0;
output [6:0] Hex1;

wire Cout;
reg [3:0] Led1 = 4'd4;
reg [3:0] Led2 = 4'd2;
reg i = 1;

ClockDivider clk_div(clk, Cout);

// Pause
always @(negedge pause)
begin
	i = ~i;
end

// Counter 
always @(posedge Cout)
begin
    if (!rst) begin
        if (sw == 1) begin
            Led1 <= 4'd0;
            Led2 <= 4'd3; 
        end else begin
            Led1 <= 4'd4;
            Led2 <= 4'd2; 
        end
    end else if (i) begin
        if (Led1 == 0 && Led2 == 0) begin
            Led1 <= 0;
            Led2 <= 0;
        end else if (Led1 == 0) begin
            Led1 <= 4'd9;
            Led2 <= Led2 - 1;
        end else begin
            Led1 <= Led1 - 1;
        end
    end
end


decimal_decoder d1(Led1, Hex0);
decimal_decoder d2(Led2, Hex1);

endmodule



