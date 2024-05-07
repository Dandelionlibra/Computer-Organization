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
    // 1
    int j = 0;
    for (int i = 31 ; i >= 0 ; i--) {
        std::cout << "MUX2_1 mux1" << "_" << j << "( .in0(dataA[" << i << "]), .in1(dataA[" << i-1
                  << "]), .sel(dataB[" << 0 << "]), .out(temp[" << i << "]) );\n";
        j++;
    }
    std::cout << std::endl;

    // 2
    j = 0;
    for (int i = 31 ; i >= 0 ; i--) {
        std::cout << "MUX2_1 mux2" << "_" << j << "( .in0(temp[" << i << "]), .in1(temp[" << i-2
                  << "]), .sel(dataB[" << 1 << "]), .out(temp1[" << i << "]) );\n";
        j++;
    }
    std::cout << std::endl;

    // 3
    j = 0;
    for (int i = 31 ; i >= 0 ; i--) {
        std::cout << "MUX2_1 mux3" << "_" << j << "( .in0(temp1[" << i << "]), .in1(temp1[" << i-4
                  << "]), .sel(dataB[" << 2 << "]), .out(temp2[" << i << "]) );\n";
        j++;
    }
    std::cout << std::endl;

    // 4
    j = 0;
    for (int i = 31 ; i >= 0 ; i--) {
        std::cout << "MUX2_1 mux4" << "_" << j << "( .in0(temp2[" << i << "]), .in1(temp2[" << i-8
                  << "]), .sel(dataB[" << 3 << "]), .out(temp3[" << i << "]) );\n";
        j++;
    }
    std::cout << std::endl;

    // 5
    j = 0;
    for (int i = 31 ; i >= 0 ; i--) {
        std::cout << "MUX2_1 mux5" << "_" << j << "( .in0(temp3[" << i << "]), .in1(temp3[" << i-16
                  << "]), .sel(dataB[" << 4 << "]), .out(temp4[" << i << "]) );\n";
        j++;
    }
    std::cout << std::endl;

}
int main() { std::cout << "OwO\n"; }