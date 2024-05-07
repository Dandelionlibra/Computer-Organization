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
    int j = 0;
    int t = 0;
    for (int i = 31 ; i >= 0 ; i--) {
        std::cout << "MUX2_1 mux5" << "_" << j << "( .in0(temp3[" << i << "]), .in1(temp3[" << i-16
                  << "]), .sel(dataB[" << 4 << "]), .out(temp4[" << t << "]) )\n";
        j++;
        t++;
    }
    std::cout << std::endl;
}
int main() { std::cout << "OwO\n"; }