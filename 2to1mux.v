module twotoonemux(control, in, in1,out);
input control;
input [11:0] in, in1;
output reg [11:0] out;
always@(control, in, in1)
begin
	if(control == 0)
		out = in;
	else
		out = in1;
end
endmodule
