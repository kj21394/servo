module PWM_Geneator(
	clk,
	rst,
	total_dur,
	on_period,
	PWM

);

 
 input clk;
 input rst;
 input [31:0] total_dur;
 input [31:0] on_period;
 output reg PWM;
 reg [31:0] ticks; 
 
 always @ (posedge clk or negedge rst)
 begin 
	if (~rst)
	begin 
		ticks <=0;
		PWM <=0;
	end
	else if (ticks >= total_dur)
	begin 
		ticks <=0;
		PWM <=0;
	end
	else
	begin
		ticks <= ticks + 1;
		PWM <= (ticks < on_period)?1'b1:1'b0;
	end
 end
 endmodule
 