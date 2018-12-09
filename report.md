# What we did
We decided to explore the lower level subtleties of optimizing matrix multiplication, so we implemented Strassen's algorithm in Verilog.
Our project explores hardware and software optimization for a specific task, which in our case was matrix multiplication, and the tradeoffs that come with it.
On the software side we found an algorithm called the Strassen’s algorithm which was faster than regular multiplication, requiring O(n^2.83) time for an nxn matrix as opposed to the O(n^3) time required by the regular algorithm.
This is because it has one less multiplication operation which is very computationally expensive.
We implemented this in Assembly using operations our hardware could run.

On the hardware side, we chose to optimize for performance and tailored it for 2x2 matrix as any matrix can be padded and broken down into units of 2x2 matrices.
We chose to have 7 ALUs, 2 Adders and 7DFFs, to parallelize the process as much as could.
Assuming all the operations are single cycle then our hardware takes 4 cycles to go through the algorithm.

Matrix multiplication is a core concept in modern data analysis.
In python, libraries such as SciPy leverage algorithms such as the ones in BLAS to operate on multidimensional matrices as quickly as possible.
This opens the door for other libraries such as OpenCV so that self driving cars can be realized, and tensorflow and scikit-learn so that search engines can deliver optimal results.
In modern developments, the influence of matrix operations cannot be understated.
Therefore, we designed hardware to multiply 2x2 matrices which can be used as a kernel for larger recursive matrix multiplication.

We began by attempting to create a full matrix multiplication circuit.
However, we quickly realized that because Strassen's algorithm recursively does block matrix multiplication until numbers are reached, we needed to create the basic 2x2 multiplication unit.
From there, we counted the amount of arithmetic operations and attempted to optimize gate cost and clock cycles.
By optimizing gate cost, we were able to use 7 arithmetic units capable of addition, subtraction, and multiplication in 5 cycles.
By optimizing for cycles, we were able to use 7 arithmetic units capable of addition, subtraction, and multiplication, and 3 additional adders to multiply the matrices in 4 cycles.
Because applications of matrix multiplication prioritize speed over gate cost, we opted to model the 4-cycle design.

We then optimized how many storage units we would need.
Since there are 7 multiplications to be done, using feedback loops only 7 DFFs are required.
We also only needed a storage unit of depth 4 to hold the 4 output matrix elements.
Due to the design of our multiplier, two elements of the output matrix are calculated on the 3rd cycle, and the last two are calculated on the 4th cycle.
Therefore, our storage unit needed only two address and data inputs and a single write enable.
