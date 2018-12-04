`include "matmult1.v"

module testbench();
   reg clk;
   initial clk = 0;

   wire signed [31:0] c11, c12, c21, c22;

   matmult1 dut
     (
      .clk(clk),
      .a11(0),
      .a12(1),
      .a21(2),
      .a22(3),
      .b11(4),
      .b12(5),
      .b21(6),
      .b22(7),
      .c11(c11),
      .c12(c12),
      .c21(c21),
      .c22(c22)
      );

   initial begin
      #1 clk = !clk;
      #1 clk = !clk;
      #1 clk = !clk;
      #1 clk = !clk;
      #1 clk = !clk;
      #1 clk = !clk;
      #1 clk = !clk;
      $display("%d %d %d %d", c11, c12, c21, c22);
   end
endmodule
