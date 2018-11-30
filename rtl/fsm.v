/**
 * Module FSM
 * Inputs: clock (clk), equality boolean (eq), command (cmd).
 * Outputs: Control signals for the multicycle CPU.
 * Function: Output the control signals for the multicycle CPU.
 */

`define ALU_ADD 0
`define ALU_SUB 1
`define ALU_MULT 2




module fsm
  (
   input            clk,
                   
   output reg [2:0] alu_op,
   output reg [1:0] mux_1,
                    mux_2,
                    mux_3,
                    mux_4,
                    
   output reg       mem_we
 
   );
   reg [2:0]        state;

   // Compute the current state
   initial state = 0;
   always @(posedge clk) state <= state + 1;
   
   always @(*) begin 
   

   case (state)
   0 : begin
           mux_1 <= 0;   
           mux_2 <= 0;
           mux_3 <= 0;
           mux_4 <= 0;
           mem_we <=0;
           
         
        end        
   1 : begin
   
           mux_2 <= 1;
           mux_3 <= 1;
           mux_4 <= 1;
           mem_we <=0;
           
         
        end      
   2 : begin
   
           mux_3 <= 2;
           mux_4 <= 2;
           mem_we <=1;
           
         
        end  
   3 : begin
           mux_4 <= 3;
           mem_we <=1;
           
         
        end
   
      
   end
endmodule