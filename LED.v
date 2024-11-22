// Seven segment decoder from Lab2 (modified)
module seven_segment_decoder(
input [3:0] in,
output [6:0] out
);
wire w = in[3];
wire x = in[2];
wire y = in[1];
wire z = in[0];

assign out[0] = (~w & ~x & ~y & z) | (~w & x & ~y & ~z) | (w & ~x & y & z) | (w & x & ~y & z);
assign out[1] = (w & x & ~y & ~z) | (~w & x & ~y & z) | (w & y & z) | (w & x & y) | (x & y & ~z);
assign out[2] = (~w & ~x & y & ~z) | (w & x & ~y & ~z) | (w & x & y & ~z) | (w & x & y & z);
assign out[3] = (~w & ~x & ~y & z) | (~w & x & ~y & ~z) | (~w & x & y & z) | (w & ~x & y & ~z) | (w & x & y & z);
assign out[4] = (~w & ~x & ~y & z) | (~w & ~x & y & z) | (~w & x & ~y & ~z) | (~w & x & ~y & z) | (~w & x & y & z) | (w & ~x & ~y & z);
assign out[5] = (~w & ~x & ~y & z) | (~w & ~x & y & ~z) | (~w & ~x & y & z) | (~w & x & y & z) | (w & x & ~y & z);
assign out[6] = (~w & ~x & ~y & ~z) | (~w & ~x & ~y & z) | (~w & x & y & z) | (w & x & ~y & ~z);
endmodule