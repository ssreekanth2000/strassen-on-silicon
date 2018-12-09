/*
 Module FSM
 Inputs: clock (clk)
 Outputs: Control signals for the multicycle CPU.
 Function: Output the control signals for the multicycle matrix multiplier.
 Comments: Muxes are planned out such that the required selector bit
 is equivalent to the state number.
 */

module fsm
  (
   input            clk,

   output reg [1:0] alu1,
                    alu2,
                    alu3,
                    alu4,
                    alu5,
                    alu6,
                    alu7,


   output reg       mux2,
   output reg [1:0] mux3,
                    mux4,

   output reg       memWe,
   memMuxCtrl
   );
   reg [2:0]        state;

   // Compute the current state
   initial state = 0;
   always @(posedge clk) state <= state + 1;

   always @(*) begin
      case (state)
        0 : begin
           mux2 = 0;
           mux3 = 0;
           mux4 = 0;
           memWe = 0;

           alu1 = 0;
           alu2 = 0;
           alu3 = 1;
           alu4 = 1;
           alu5 = 0;
           alu6 = 1;
           alu7 = 1;
        end

        1 : begin
           mux2 = 1;
           mux3 = 1;
           mux4 = 1;
           memWe = 0;

           alu1 = 2;
           alu2 = 2;
           alu3 = 2;
           alu4 = 2;
           alu5 = 2;
           alu6 = 2;
           alu7 = 2;
        end

        2 : begin
           mux3 = 2;
           mux4 = 2;
           memWe = 1;

           alu1 = 0;
           alu2 = 1;
           alu3 = 0;
           alu4 = 0;
           alu5 = 1;
           alu6 = 0;
           memMuxCtrl = 0;
        end

        3 : begin
           mux4 = 3;
           memWe = 1;

           alu1 = 0;
           alu2 = 0;
           memMuxCtrl = 1;
        end
      endcase
   end
endmodule
