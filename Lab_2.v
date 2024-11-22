// In minterm form, the function was originally f = ab~c + abc
// Reduction:
// f = ab~c + abc
// = ab(~c + c)
// = ab(1)
// = ab
//assign f = a & b;

//Name: Hao Liu, YouWei Qin
//Stududent #:218703991, 219690858

//Reduction for truth table: ~A~B~CD+~A~BCD+~AB~C~D+~AB~CD+~ABCD+A~B~CD
//F= ~A~B(~CD+CD)+~AB(~C~D+~CD+CD)+A~B~CD
//F= ~A~BD+~AB(~C+D)A~B~CD
//F= ~A~BD+~AB~C+~ABD+A~B~CD   
//I think this is the furtherest it can simplify.


module Lab_2(s,l);
// assign input and output
input [0:3] s;  // 4-bit input are for the switch (s[3:0] = input #'s from 0 to F)
output [0:6] l; // 7-bit output controls each segment to display the #'s

// Truth table and Boolean function for each segment of the display
// I assigned 7 output and 4 input for all the assign variables
// for each array it represents a number.
assign l [0] = (~s[0] & ~s[1] & ~s[2] & s[3])|
(~s[0] & s[1] & ~s[2] & ~s[3])|
(s[0] & ~s[1] & s[2] & s[3])  |
(s[0] & s[1] & ~s[2] & s[3]);

assign l [1] = (~s[0] & s[1] & ~s[2] & s[3])|
(~s[0] & s[1] & s[2] & ~s[3])|
(s[0] & ~s[1] & s[2] & s[3]) |
(s[0] & s[1] & ~s[2] & ~s[3])|
(s[0] & s[1] & s[2] & ~s[3]) |
(s[0] & s[1] & s[2] & s[3]);

assign l [2] = (~s[0] & ~s[1] & s[2] & ~s[3])|
(s[0] & s[1] & ~s[2] & ~s[3]) |
(s[0] & s[1] & s[2] & ~s[3])  |
(s[0] & s[1] & s[2] & s[3]);

assign l [3] = (~s[0] & ~s[1] & ~s[2] & s[3])|
(~s[0] & s[1] & ~s[2] & ~s[3])|
(~s[0] & s[1] & s[2] & s[3])  |
(s[0] & ~s[1] & s[2] & ~s[3]) |
(s[0] & s[1] & s[2] & s[3]);

assign l [4] = (~s[0] & ~s[1] & ~s[2] & s[3])|
(~s[0] & ~s[1] & s[2] & s[3]) |
(~s[0] & s[1] & ~s[2] & ~s[3])|
(~s[0] & s[1] & ~s[2] & s[3]) |
(~s[0] & s[1] & s[2] & s[3])  |
(s[0] & ~s[1] & ~s[2] & s[3]);

assign l [5] = (~s[0] & ~s[1] & ~s[2] & s[3])|
(~s[0] & ~s[1] & s[2] & ~s[3])|
(~s[0] & ~s[1] & s[2] & s[3]) |
(~s[0] & s[1] & s[2] & s[3])  |
(s[0] & s[1] & ~s[2] & s[3]);

assign l [6] = (~s[0] & ~s[1] & ~s[2] & ~s[3])|
(~s[0] & ~s[1] & ~s[2] & s[3]) |
(~s[0] & s[1] & s[2] & s[3])   |
(s[0] & s[1] & ~s[2] & ~s[3]);

endmodule