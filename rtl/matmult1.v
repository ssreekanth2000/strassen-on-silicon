`include "alu.v"
`include "fsm.v"
`include "mux.v"
`include "mux4way.v"
`include "c_storage.v"

module matmult1
  (
   input         clk,
   input [31:0]  a11, a12, a21, a22, b11, b12, b21, b22,
   output [31:0] c11, c12, c21, c22
   );

   reg [31:0]    b22PlusB11, b11PlusB12, b21PlusB22;
   always @* begin
      b22PlusB11 = b22 + b11;
      b11PlusB12 = b11 + b12;
      b21PlusB22 = b21 + b22;
   end

   reg [31:0]   m1, m2, m3, m4, m5, m6, m7;
   wire [31:0]  alu1Out, alu2Out, alu3Out, alu4Out, alu5Out, alu6Out, alu7Out;
   wire [1:0]   alu1Op, alu2Op, alu3Op, alu4Op, alu5Op, alu6Op, alu7Op;
   wire         mux2Sel;
   wire [1:0]   mux3Sel, mux4Sel;
   wire         memWe, memMuxCtrl;

   fsm fsm0
     (
      .clk(clk),
      .alu1(alu1Op),
      .alu2(alu2Op),
      .alu3(alu3Op),
      .alu4(alu4Op),
      .alu5(alu5Op),
      .alu6(alu6Op),
      .alu7(alu7Op),
      .mux2(mux2Sel),
      .mux3(mux3Sel),
      .mux4(mux4Sel),
      .memWe(memWe),
      .memMuxCtrl(memMuxCtrl)
      );

   wire [31:0]  mux1Out, mux2Out, mux3Out, mux4Out, mux5Out, mux6Out,
                mux7Out, mux8Out, mux9Out, mux10Out, mux11Out,
                mux12Out, mux13Out, mux14Out;

   mux mux1
     (
      .out(mux1Out),
      .sel(mux2Sel),
      .in0(a11),
      .in1(m1)
      );

   mux4way mux2
     (
      .out(mux2Out),
      .sel(mux4Sel),
      .in0(a22),
      .in1(b22PlusB11),
      .in2(m4),
      .in3(m5)
      );

   mux4way mux3
     (
      .out(mux3Out),
      .sel(mux4Sel),
      .in0(a21),
      .in1(b11),
      .in2(m1),
      .in3(m6)
      );

   mux mux4
     (
      .out(mux4Out),
      .sel(mux2Sel),
      .in0(a22),
      .in1(m2)
      );

   mux4way mux5
     (
      .out(mux5Out),
      .sel(mux3Sel),
      .in0(b12),
      .in1(a11),
      .in2(m5),
      .in3(m5)
      );

   mux mux6
     (
      .out(mux6Out),
      .sel(mux2Sel),
      .in0(b22),
      .in1(m3)
      );

   mux4way mux7
     (
      .out(mux7Out),
      .sel(mux3Sel),
      .in0(b21),
      .in1(a22),
      .in2(m2),
      .in3(m2)
      );

   mux mux8
     (
      .out(mux8Out),
      .sel(mux2Sel),
      .in0(b11),
      .in1(m4)
      );

   mux4way mux9
     (
      .out(mux9Out),
      .sel(mux3Sel),
      .in0(a11),
      .in1(b22),
      .in2(m7),
      .in3(m7)
      );

   mux mux10
     (
      .out(mux10Out),
      .sel(mux2Sel),
      .in0(a12),
      .in1(m5)
      );

   mux4way mux11
     (
      .out(mux11Out),
      .sel(mux3Sel),
      .in0(a21),
      .in1(m6),
      .in2(m6),
      .in3(m6)
      );

   mux4way mux12
     (
      .out(mux12Out),
      .sel(mux3Sel),
      .in0(a11),
      .in1(b11PlusB12),
      .in2(m3),
      .in3(m3)
      );

   mux mux13
     (
      .out(mux13Out),
      .sel(mux2Sel),
      .in0(a12),
      .in1(m7)
      );

   mux mux14
     (
      .out(mux14Out),
      .sel(mux2Sel),
      .in0(a22),
      .in1(b21PlusB22)
      );

   alu alu1
     (
      .a(mux1Out),
      .b(mux2Out),
      .op(alu1Op),
      .result(alu1Out)
      );

   alu alu2
     (
      .a(mux3Out),
      .b(mux4Out),
      .op(alu2Op),
      .result(alu2Out)
      );

   alu alu3
     (
      .a(mux5Out),
      .b(mux6Out),
      .op(alu3Op),
      .result(alu3Out)
      );

   alu alu4
     (
      .a(mux7Out),
      .b(mux8Out),
      .op(alu4Op),
      .result(alu4Out)
      );

   alu alu5
     (
      .a(mux9Out),
      .b(mux10Out),
      .op(alu5Op),
      .result(alu5Out)
      );

   alu alu6
     (
      .a(mux11Out),
      .b(mux12Out),
      .op(alu6Op),
      .result(alu6Out)
      );

   alu alu7
     (
      .a(mux13Out),
      .b(mux14Out),
      .op(alu7Op),
      .result(alu7Out)
      );

   wire [31:0]  dIn1, dIn2;

   mux dInMux1
     (
      .out(dIn1),
      .sel(memMuxCtrl),
      .in0(alu3Out),
      .in1(alu1Out)
      );

   mux dInMux2
     (
      .out(dIn2),
      .sel(memMuxCtrl),
      .in0(alu4Out),
      .in1(alu2Out)
      );

   wire [1:0]   addr1, addr2;

   mux #(.width(2)) addrMux1
     (
      .out(addr1),
      .sel(memMuxCtrl),
      .in0(2'h1),
      .in1(2'h0)
      );

   mux #(.width(2)) addrMux2
     (
      .out(addr2),
      .sel(memMuxCtrl),
      .in0(2'h2),
      .in1(2'h3)
      );     

   c_storage cMem
     (
      .clk(clk),
      .addr1(addr1),
      .addr2(addr2),
      .we(memWe),
      .dIn1(dIn1),
      .dIn2(dIn2),
      .c1(c11),
      .c2(c12),
      .c3(c21),
      .c4(c22)
      );

   always @(posedge clk) begin
      m1 <= alu1Out;
      m2 <= alu2Out;
      m3 <= alu3Out;
      m4 <= alu4Out;
      m5 <= alu5Out;
      m6 <= alu6Out;
      m7 <= alu7Out;
   end
endmodule
