//Name: Hao Liu, YouWei Qin 
//Student #: 218703991, 219690858

`timescale 1 ns/ 1 ps //set the timescale
module Test1();
//Inputs
reg a;
reg b;
reg c;
// Outputs
wire x;
wire y;
//all the deivce under this test
test1 DeviceUnderTest(.a(a), .b(b), .c(c), .x(x), .y(y)); 

initial
begin
//All Case is based on the 4-bit truth table.
//Case 1
	a = 0;
	b = 0;
	c = 0;
	#20; //Ticks
	if (x == 0 & y == 0)
		$display("Outputs = zero");
//Case 2
	a = 0;
	b = 0;
	c = 1;
	#20;
	if (x == 0 & y == 0)
		$display("Outputs = zero");
//Case 3	
	a = 0;
	b = 1;
	c = 0;
	#20;
	if (x == 0 & y == 0)
		$display("Outputs = zero");
//Case 4
	a = 0;
	b = 1;
	c = 1;
	#20; 
	if (x == 0 & y == 0)
		$display("Outputs = zero");
//Case 5
	a = 1;
	b = 0;
	c = 0;
	#20;
	if (x == 0 & y == 0)
		$display("Outputs = zero");
//Case 6
	a = 1;
	b = 0;
	c = 1;
	#20;
	if (x == 0 & y == 0)
		$display("Outputs = zero");
//Case 7
	a = 1;
	b = 1;
	c = 0;
	#20;
	if (x == 0 & y == 0)
		$display("Outputs = zero");
//Case 8
	a = 1;
	b = 1;
	c = 1;
	#20;
	if (x == 0 & y == 0)
		$display("Outputs = zero");

end

endmodule