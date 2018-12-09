#include <algorithm>
#include <Vmatmult1.h>
#include <verilated_fst_c.h>
#include <cmath>
#include <stdlib.h>
#include <eigen3/Eigen/Dense>
#include <iostream>

int main(int argc, char** argv)
{
  Verilated::commandArgs(argc, argv);

  bool success = true;

  // Generate 512 test cases
  for (auto i = 0; i < 512; i++)
    {
      Vmatmult1 dut;
      std::vector<int> nums;
      // Populate test case arguments with random numbers which do not cause int overflow.
      for (auto j = 0; j < 8; j++)
        nums.push_back((rand() % (int) pow(2, 15)) - pow(2, 14));
      
      dut.a11 = nums[0];
      dut.a12 = nums[1];
      dut.a21 = nums[2];
      dut.a22 = nums[3];
      dut.b11 = nums[4];
      dut.b12 = nums[5];
      dut.b21 = nums[6];
      dut.b22 = nums[7];

      // Generate expected result
      Eigen::Matrix2d a, b;
      a << nums[0], nums[1], nums[2], nums[3];
      b << nums[4], nums[5], nums[6], nums[7];

      const auto c = a * b;

      // The operation takes 4 cycles
      for (auto j = 0; j < 4; j++)
        {
          dut.clk = 0;
          dut.eval();
          dut.clk = 1;
          dut.eval();
        }

      // Report errors
      if (dut.c11 != (int) c(0, 0)
          || dut.c12 != (int) c(0, 1)
          || dut.c21 != (int) c(1, 0)
          || dut.c22 != (int) c(1, 1))
        {
          std::cout << "Failed on:" << std::endl;
          std::cout << a << std::endl;
          std::cout << "x" << std::endl;
          std::cout << b << std::endl;
          std::cout << "=" << std::endl;
          std::cout << c << std::endl;
          printf("Was [[%d, %d], [%d, %d]]\n", dut.c11, dut.c12, dut.c21, dut.c22);
          success = false;
        }
          std::cout << a << std::endl;
          std::cout << "x" << std::endl;
          std::cout << b << std::endl;
          std::cout << "=" << std::endl;
          printf("[[%d, %d], [%d, %d]]\n\n", dut.c11, dut.c12, dut.c21, dut.c22);
          std::cout << "---" << std::endl<<std::endl;

    }

  printf("Success: %d, 1 means success\n", success);
}
