/*
	1. Memory Design coding
	 a. Consider example: 1Kb memory with WIDTH = 16
		  i. DEPTH? (2 ** 10/2 ** 4)
	 b. Name of module: memory
		  i. Module memory
		  ii. Ports: clk, rst, addr, wr_rd, etc with their directions as
		  _ior_o
	 c. Make memory code parameterizable
		  i. List down parameters
	 d. Define memory ports

	 e. Define memory using DEPTH and WIDTH

	 f. Create basic TB
		  i. Memory is array of vector
		  ii. Include memory.v
		  iii. Define module tb
		  iv. Instantiate memory
		  v. Run the simulation
			   1. To check if compilation and simulation are happening properly.
	 g. Coming up with Memory algorithm
		  i. Implement using Verilog


*/
//Memory Design
module memory #(parameter depth = 16,width = 4,addr_width = $clog2(depth))
(clk_i,rst_i,wr_rd_i,valid_i,wdata_i,addr_i,ready_o,rdata_o);
	
	//Signals declaration
	input clk_i,rst_i,wr_rd_i,valid_i;
	input [width-1:0] wdata_i;
	input [addr_width-1:0] addr_i;
	integer i;

	output reg ready_o;
	output reg[width-1:0] rdata_o;

	reg [width-1:0] mem [depth-1:0];

	always@(posedge clk_i) begin //used Synchronous active high reset here (rst will be activated if rst is 1)
		 if(rst_i) begin
			  ready_o <= 0;
			  rdata_o <= 0;

			  for(i=0;i<depth;i=i+1) mem[i] <= 0;
		 end
		 
		 else begin
			  if(valid_i) begin
				   ready_o <= 1;
				   if(wr_rd_i) mem[addr_i] <= wdata_i;
				   else rdata_o <= mem[addr_i];
			  end
		 	  else ready_o <= 0;
		 end
	end

endmodule



