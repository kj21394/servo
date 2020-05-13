module interface(
 clk,
 rst, 
 angle,
 speed,
 out_angle
 
);
 
 input  clk;
 input rst;
 input [7:0] angle;
 input [2:0] speed;
 output  reg [7:0] out_angle;
 
 `define adj_angle 1
 
 reg [21:0] count;
 
 always @ (posedge clk or negedge rst)
 begin 
	if (!rst)
	begin 
		out_angle <= 8'd60;
		count <= 0;
	end
	else
	begin
		if (angle > out_angle)
		begin 
			if (count[21] & (out_angle != 180))
			begin
				count <= 0;
				out_angle <= out_angle + `adj_angle;
			end
			else
				count <= count + speed + 1; 
		end	
		else if (angle < out_angle)
		begin 
			if (count[21] & (out_angle != 180))
			begin
				count <= 0;
				out_angle <= out_angle - `adj_angle;
			end
			else
				count <= count + speed + 1; 
		end
	end
 end
endmodule 
