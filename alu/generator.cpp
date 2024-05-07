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
    for (int j = 1 ; j < 6 ; j++) {
        for (int i = 31 ; i >= 0 ; i--) {
            if (i == 31)
                std::cout << "MUX2_1 mux" << j << "_" << 31-i << "( 0, .in1(dataA["
                          << i << "]), .Signal(dataB[" << j - 1 << "]), .dataOut(temp[" << 31-i << "]) )"
                          << std::endl;
            else
                std::cout << "MUX2_1 mux" << j << "_" << 31-i << "( .in0(dataA[" << i+1 << "]), .in1(dataA["
                          << i << "]), .Signal(dataB[" << j - 1 << "]), .dataOut(temp[" << 31-i << "]) )"
                          << std::endl;


            /*
            if (i == 0)
                std::cout << "MUX2_1 mux" << j << "_" << i << "( .in0(dataA[" << i << "]), 0, .Signal(dataB["
                          << j - 1 << "]), .dataOut(temp[" << i << "]) )" << std::endl;
            else
                std::cout << "MUX2_1 mux" << j << "_" << i << "( .in0(dataA[" << i << "]), .in1(dataA["
                          << i + 1 << "]), .Signal(dataB[" << j - 1 << "]), .dataOut(temp[" << i << "]) )"
                          << std::endl;
            */
        }

        std::cout << std::endl;
    }
}
int main() { std::cout << "OwO\n"; }