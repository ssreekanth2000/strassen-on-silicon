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

  for (auto i = 0; i < 512; i++)
    {
      Vmatmult1 dut;
      std::vector<int> nums;
      for (auto j = 0; j < 8; j++)
        nums.push_back(rand() % (int) pow(2, 15));
      

      dut.a11 = nums[0];
      dut.a12 = nums[1];
      dut.a21 = nums[2];
      dut.a22 = nums[3];
      dut.b11 = nums[4];
      dut.b12 = nums[5];
      dut.b21 = nums[6];
      dut.b22 = nums[7];

      Eigen::Matrix2d a, b, c;
      a << nums[0], nums[1], nums[2], nums[3];
      b << nums[4], nums[5], nums[6], nums[7];

      c = a * b;

      for (auto j = 0; j < 4; j++)
        {
          dut.clk = 0;
          dut.eval();
          dut.clk = 1;
          dut.eval();
        }

      if (dut.c11 != c(0, 0)
          || dut.c12 != c(0, 1)
          || dut.c21 != c(1, 0)
          || dut.c22 != c(1, 1))
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
    }
  printf("Success: %d\n", success);
}
