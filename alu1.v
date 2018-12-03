
 * Module FSM
.

`include "alu.v"

`include "memory.v"
`include "mux4way.v"


module cpu
  #(parameter instruction="mem/data.dat")
   (input clk);

 
   reg [31:0]  ir;
   reg [31:0]  a1;
   reg [31:0]  a2;
   reg [31:0]  a3;
   reg [31:0]  a4;
   reg [31:0]  a5;
   reg [31:0]  a6;
   reg [31:0]  a7;
   reg [31:0]  a8;
   reg [31:0]  a9;
   reg [31:0]  a10;
   
   

   initial ir =  {mem0.mem[0], mem0.mem[1], mem0.mem[2], mem0.mem[3]};  
   wire= mem_we;


   
   wire [2:0]  alu1;
   wire [2:0]  alu2;
   wire [2:0]  alu3;
   wire [2:0]  alu4;
   wire [2:0]  alu5;
   wire [2:0]  alu6;
   wire [2:0]  alu7;
   wire [2:0]  alu8;
   wire [2:0]  alu9;
   wire [2:0]  alu10;
   wire [2:0]  mux_1;
   wire [2:0]  mux_2;
   wire [2:0]  mux_3;
   wire [2:0]  mux_4;
   wire [31:0]  alu_1;
   wire [31:0]  alu_2;
   wire [31:0]  alu_3;
   wire [31:0]  alu_4;
   wire [31:0]  alu_5;
   wire [31:0]  alu_6;
   wire [31:0]  alu_7;
   wire [31:0]  alu_8;
   wire [31:0]  alu_9;
   wire [31:0]  alu_10; 
   wire [31:0]  blu_1;
   wire [31:0]  blu_2;
   wire [31:0]  blu_3;
   wire [31:0]  blu_4;
   wire [31:0]  blu_5;
   wire [31:0]  blu_6;
   wire [31:0]  blu_7;
   wire [31:0]  blu_8;
   wire [31:0]  blu_9;
   wire [31:0]  blu_10;

   fsm fsm0
     (
      .alu1(alu1),
      .alu2(alu2),
      .alu3(alu3),
      .alu4(alu4),
      .alu5(alu5),
      .alu6(alu6),
      .alu7(alu7),
      .alu8(alu8),
      .alu9(alu9),
      .alu10(alu10), 
      .mem_we(mem_we)
      .mux_1(mux_1)
      .mux_2(mux_2)
      .mux_3(mux_3)
      .mux_4(mux_4)
      

      );

  


   mux4way 1
     (
      .out(alu_1),
      .sel(mux_4),
      .in0(a11),
      .in1(a22),
      .in2(b),
      .in3(4)
      ); 
   mux4way 2
     (
      .out(alu_2),
      .sel(mux_4),
      .in0(sxi<<2),
      .in1(sxi),
      .in2(b),
      .in3(4)
      );
   mux4way 3
     (
      .out(alu_3),
      .sel(mux_4),
      .in0(sxi<<2),
      .in1(sxi),
      .in2(b),
      .in3(4)
      );      
   mux4way 4
     (
      .out(alu_4),
      .sel(mux_4),
      .in0(sxi<<2),
      .in1(sxi),
      .in2(b),
      .in3(4)
      );
   mux4way 5
     (
      .out(alu_5),
      .sel(mux_4),
      .in0(sxi<<2),
      .in1(sxi),
      .in2(b),
      .in3(4)
      );   
   mux4way 6
     (
      .out(alu_6),
      .sel(mux_4),
      .in0(sxi<<2),
      .in1(sxi),
      .in2(b),
      .in3(4)
      );   
    mux4way 7
     (
      .out(alu_7),
      .sel(mux_4),
      .in0(sxi<<2),
      .in1(sxi),
      .in2(b),
      .in3(4)
      );
    mux4way 8
     (
      .out(alu_8),
      .sel(mux_4),
      .in0(sxi<<2),
      .in1(sxi),
      .in2(b),
      .in3(4)
      );
   mux4way 9
     (
      .out(alu_9),
      .sel(mux_4),
      .in0(sxi<<2),
      .in1(sxi),
      .in2(b),
      .in3(4)
      );
   mux4way 10
     (
      .out(alu_10),
      .sel(mux_4),
      .in0(sxi<<2),
      .in1(sxi),
      .in2(b),
      .in3(4)
      );
   mux4way 11
     (
      .out(blu_1),
      .sel(mux_4),
      .in0(sxi<<2),
      .in1(sxi),
      .in2(b),
      .in3(4)
      ); 
   mux4way 12
     (
      .out(blu_2),
      .sel(mux_4),
      .in0(sxi<<2),
      .in1(sxi),
      .in2(b),
      .in3(4)
      );
   mux4way 13
     (
      .out(blu_3),
      .sel(mux_4),
      .in0(sxi<<2),
      .in1(sxi),
      .in2(b),
      .in3(4)
      );      
   mux4way 14
     (
      .out(blu_4),
      .sel(mux_4),
      .in0(sxi<<2),
      .in1(sxi),
      .in2(b),
      .in3(4)
      );
   mux4way 15
     (
      .out(blu_5),
      .sel(mux_4),
      .in0(sxi<<2),
      .in1(sxi),
      .in2(b),
      .in3(4)
      );   
   mux4way 16
     (
      .out(blu_6),
      .sel(mux_4),
      .in0(sxi<<2),
      .in1(sxi),
      .in2(b),
      .in3(4)
      );   
    mux4way 17
     (
      .out(blu_7),
      .sel(mux_4),
      .in0(sxi<<2),
      .in1(sxi),
      .in2(b),
      .in3(4)
      );
    mux4way 18
     (
      .out(blu_8),
      .sel(mux_4),
      .in0(sxi<<2),
      .in1(sxi),
      .in2(b),
      .in3(4)
      );
   mux4way 19
     (
      .out(blu_9),
      .sel(mux_4),
      .in0(sxi<<2),
      .in1(sxi),
      .in2(b),
      .in3(4)
      );
   mux4way 20
     (
      .out(blu_10),
      .sel(mux_4),
      .in0(sxi<<2),
      .in1(sxi),
      .in2(b),
      .in3(4)
      );                    
   alu a_1
     (
      .result(a1),
      .operandA(alu_1),
      .operandB(blu_1),
      .command(alu1)
      );
   alu a_2
     (
      .result(a2),
      .operandA(alu_2),
      .operandB(blu_2),
      .command(alu1)
      );
   alu a_3
     (
      .result(a3),
      .operandA(alu_3),
      .operandB(blu_3),
      .command(alu3)
      );
   alu a_4
     (
      .result(a3),
      .operandA(alu_4),
      .operandB(blu_4),
      .command(alu4)
      );
   alu a_5
     (
      .result(a1),
      .operandA(alu_5),
      .operandB(blu_5),
      .command(alu5)
      );
   alu a_6
     (
      .result(a1),
      .operandA(alu_6),
      .operandB(blu_6),
      .command(alu6)
      );
   alu a_7
     (
      .result(a1),
      .operandA(alu_7),
      .operandB(blu_7),
      .command(alu7)
      );
   alu a_8
     (
      .result(a1),
      .operandA(alu_8),
      .operandB(blu_8),
      .command(alu8)
      );
   alu a_9
     (
      .result(a1),
      .operandA(alu_9),
      .operandB(blu_9),
      .command(alu9)
      );
   alu a_10
     (
      .result(a1),
      .operandA(alu_10),
      .operandB(blu_10),
      .command(alu10)
      );


   memory  mem0
     (
      .dOut(dOut),
      .clk(clk),
      .addr1(1),
      .addr2(2)
      .we(mem_we),
      .dIn1(a1)
      .dIn2(a2)
      
      );

   wire [31:0] dOut


 

endmodule