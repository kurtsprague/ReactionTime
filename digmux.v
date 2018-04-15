module digmux(a,b,switch,out);

input [3:0] a,b;
input switch;
output reg [3:0] out;

always@(a,b)
begin
	if(switch == 0)
		out <= a;
	if(switch == 1)
		out <= b;
end

endmodule
