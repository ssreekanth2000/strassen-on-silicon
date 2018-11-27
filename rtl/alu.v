/* Module ALU
 * Inputs: 32 bit signed a and b values, operation code op.
 * Output: 32 bit signed output result
 * Function:
 *   - op = 0: result = a + b
 *   - op = 1: result = a - b
 *   - op = 2: result = a * b
*/

module alu
  (input signed [31:0] a, b,
   input [2:0]   op,
   output reg signed [31:0] result
   );

   always @*
     case (op)
       0 : result = a + b;
       1 : result = a - b;
       2: result = a * b;
       default : result = a + b;
     endcase
endmodule
