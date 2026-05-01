`include "memory_ass1.v"

module tb #(parameter width = 4,depth = 16, addr_width = $clog2(depth));
	reg clk_i,rst_i,valid_i,wr_rd_i;
	reg [width-1:0] wdata_i;
	reg [addr_width-1:0] addr_i;
	integer i;

	wire ready_o;
	wire [width-1:0] rdata_o;

	memory #(.width(width),.depth(depth),.addr_width(addr_width)) dut (
		 .clk_i(clk_i),
		 .rst_i(rst_i),
		 .valid_i(valid_i),
		 .wr_rd_i(wr_rd_i),
		 .wdata_i(wdata_i),
		 .addr_i(addr_i),
		 .ready_o(ready_o),
		 .rdata_o(rdata_o)
	);

	always #5 clk_i = ~clk_i;
	
	task reset();
		 begin
			  rst_i=1;
			  wr_rd_i = 0;
			  wdata_i = 0;
			  valid_i = 0;
			  addr_i = 0;

			  repeat(2) @(posedge clk_i);
			  rst_i=0;
		 end
	endtask

	task write();
		 begin
			  for(i=0;i<depth;i=i+1) begin
				   @(posedge clk_i);
				   wr_rd_i = 1;
				   wdata_i = $random();
				   addr_i = i;
				   valid_i = 1;
				   wait(ready_o == 1);
			  end

			  @(posedge clk_i);
			  {wr_rd_i,wdata_i,addr_i,valid_i} = 0;
		 end
	endtask

	task read();
		 begin
			  for(i=0;i<depth;i=i+1) begin
				   @(posedge clk_i);
				   wr_rd_i = 0;
				   addr_i = i;
				   valid_i = 1;
			  end

			  @(posedge clk_i);
			  {wr_rd_i,addr_i,valid_i} = 0;
		 end
	endtask

	initial begin
		clk_i=0;
		reset();

		write();
		read();
   end

   initial #1000 $finish();
endmodule





