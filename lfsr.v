// ====================================
//   Ver  :| Authors					
//   V1.1 :| Andrew Zhu & Kurt Sprague
// ====================================

//module for an LFSR
//takes in clock and a trigger signal
//outputs an enable, and an output 
module LFSR(clk,stop,cenable,out);
input clk;
input stop;
output reg [6:0] out;
output reg cenable;

//wire declaration and buffer 
wire feed;
reg [6:0] buffout;


//our "seed" is an EXNOR gate
assign feed = !(buffout[6] ^ buffout[5]);

//always triggering on clock edge
//if triggered output = to buffer
// if not then buffer changes
always@(posedge clk)
begin
	if (stop) begin
		out <= {buffout[6],buffout[5],buffout[4],buffout[3], buffout[2], buffout[1], buffout[0]};
		cenable <= 1;
		end
	else begin
			buffout <= {buffout[5],buffout[4],buffout[3],buffout[2], buffout[1], buffout[0], feed};
			cenable <= 0;
		end
end		
		
endmodule
