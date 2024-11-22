//Name: Hao Liu, YouWei Qin 
//Student #: 218703991, 219690858

`timescale 1 ns/ 1 ps //set the timescale

module Test2;
//Inputs
reg clk,a;
//Outputs
wire [3:0] x;
//all the deivce under this test
Test2 DeviceUnderTest(clk, a, x);

always 
//toggle a over time
begin
a = 0;
#100;
a = 1;
#200;
a = 0;
$stop;
end
 
always 
//generate a continuour clk signal
	begin
	clk = 1'b1; 
	#10; 
	clk = 1'b0;
	#10;
	end 

always @(x)
//monitor the output signal and report it if x is zero
begin
if(x == 4'd0)
	begin
	$display("Outputs = zero");
	end
end

endmodule