#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <algorithm>
#include <iomanip>
#include <iostream>
#include <map>
#include <queue>
#include <set>
#include <string>
#include <vector>

__attribute__((constructor)) void before_main() {
    for (int j = 1; j < 6; j++) {
        for (int i = 1, dataB = 0; i < 33; i++) {
            if (i == 32)
                std::cout << "MUX2_1 mux" << j << "_" << i << "( .in0(dataA[" << i << "]), 0, .sel(dataB["
                          << j - 1 << "]), .out(temp0[" << i - 1 << "]) )" << std::endl;
            else
                std::cout << "MUX2_1 mux" << j << "_" << i << "( .in0(dataA[" << i << "]), .in1(dataA["
                          << i + 1 << "]), .sel(dataB[" << j - 1 << "]), .out(temp0[" << i - 1 << "]) )"
                          << std::endl;
        }

        std::cout << std::endl;
    }
}
int main() { std::cout << "OwO\n"; }