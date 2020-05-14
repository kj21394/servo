module UI(   
 clk,
 rst, 
 angle,
 speed,
 out_angle			
);

input 		 	  clk;
input 		 	  rst;
input    wire [7:0] angle;
input      [1:0] speed;
output reg [7:0] out_angle;

`define AdjAngle 1
`define MAX_Angle 180
`define MIN_Angle 0
reg [21:0] count;



always@(posedge clk or negedge rst)
begin
  if(!rst)
  begin
    out_angle <= 8'd60;
    count <= 0;
  end
  else
  begin
    if (angle > out_angle)
		begin 
			if (count[21] & (out_angle != angle))
			begin
				count <= 0;
				out_angle <= out_angle + `AdjAngle;
			end
			else
				count <= count + speed + 2; 
		end	
		else if (angle < out_angle)
		begin 
			if (count[21] & (out_angle != angle))
			begin
				count <= 0;
				out_angle <= out_angle - `AdjAngle;
			end
			else
				count <= count + speed + 2; 
		end
  end
end

endmodule 