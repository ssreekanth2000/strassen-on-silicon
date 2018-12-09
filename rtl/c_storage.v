/*
 Module c_storage
 
 Inputs: clk, addr1, addr2, we, dIn1, dIn2
 Outputs: c1, c2, c3, c4
 Function:
 c1 = mem[0]
 c2 = mem[1]
 c3 = mem[2]
 c4 = mem[3]
 if we:
   mem[addr1] = dIn1
   mem[addr2] = dIn2
 */

module c_storage
  #(
    parameter width = 32
    )
   (
    input              clk,
    input [1:0]        addr1,
    input [1:0]        addr2,
    input              we,
    input [width-1:0]  dIn1,
    input [width-1:0]  dIn2,
    output [width-1:0] c1,
    output [width-1:0] c2,
    output [width-1:0] c3,
    output [width-1:0] c4
    );

   reg [width-1:0]     mem [3:0];

   always @(posedge clk) begin
      if (we)
        begin
           mem[addr1] <= dIn1;
           mem[addr2] <= dIn2;
        end
      // {c1, c2, c3, c4} <= mem;
   end
   assign c1 = mem[0],
     c2 = mem[1],
     c3 = mem[2],
     c4 = mem[3];
endmodule
