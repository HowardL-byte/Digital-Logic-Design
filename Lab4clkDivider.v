module ClkDivider(Cin,Cout);
input Cin;
output reg Cout;
   
reg[31:0] Count = 32'd0;
parameter T = 25000000;  				// switch every 0.5 sec  

always @(posedge Cin) begin
        
    if (Count >= T-1) begin         //reset to 0
        Count <= 32'd0;
        Cout  <= ~Cout;                     
    end else begin
        Count <= Count + 32'd1;
    end
end

endmodule