/*
 Module memory
 
 Inputs: clk, addr1, addr2, instrAddr, we, dIn1, dIn2
 Outputs: dOut, instrOut
 Function:
 dOut = mem[addr]
 instrOut = mem[instrAddr]
 if we then mem[addr] = din.
 Comments: This is made to the MIPS spec, so the width is a byte and
 aword is 4 bytes i.e data in and data out are 32 bits, which span 4
 bytes.
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
