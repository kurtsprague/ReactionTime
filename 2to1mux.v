module threetoonemux(control, control1, in, in1,in2,out);
input control;
input control1;
input [41:0] in, in1, in2;
output reg [41:0] out;
always@(control, control1, in, in1, in2)
begin
	if(control == 0 && control1 == 0)
		out = in2;
	else if(control == 1)
		out = in;
	else
		out = in1; 
end
endmodule
