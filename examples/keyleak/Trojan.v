module Trojan(
    input clk,
	input rst,
    input r1,
    input r2,
	input r3,
	input r4,
	output trigger
    );

	reg [12: 0] counter;
	
	always @ (posedge clk)
		begin
			if (~rst) counter = 0;

			case ({r1,r2,r3,r4})
				4'b1000 : counter = counter + 1;
				4'b1001 : counter = counter + 1;
				4'b1010 : counter = counter + 1;
				4'b1011 : counter = counter + 1;
				4'b0100 : counter = counter + 1;
				4'b0101 : counter = counter + 1;
				4'b0110 : counter = counter + 1;
				4'b0111 : counter = counter + 1;
				4'b1100 : counter = counter + 1;
				4'b1101 : counter = 0;
				default : counter = counter;
			endcase		
		end

	assign trigger = counter[12];

	always @ (posedge trigger) $display("Trojan Activated");

endmodule
