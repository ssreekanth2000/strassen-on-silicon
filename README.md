# strassen-on-silicon
CA FA18 Lab 5 

# Running the testbench
The unit does not handle carries or overflows.
Hence, it is sufficient to just test a random sample of 512 possible matrix equations, as edge cases such as overflows need not to be tested.

- `cd testbench`
- `make`
- `make run`

# Performance

Suppose that we had a single process with Strassen's algorithm, assuming the matrices are square and have dimensions that are a power of 2.
Single threaded Strassen would require 25 cycles.
10-threaded Strassen could require 4 cycles.


## Our design

![alt text](https://github.com/ssreekanth2000/strassen-on-silicon/blob/master/Untitled%20Diagram.png)

### FSM
- 4 states with free reset logic if implemented with counter
- 12 outputs
- ALUs are the only things that need more hardware
- These LUTs have only 2 gates at most, a two-input gate and a not gate.

### Circuit
- 7 multipliers
- 9 adders
- 6 subractors

- 7 2-way muxes
- 5 3-way muxes
- 2 4-way muxes
- 7 dffs
- 1 memory storage with 4 outputs, 3 inputs, one write enable
