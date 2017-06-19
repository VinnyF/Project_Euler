#include <iostream>
#include <math.h>

int main() {

    long triangle = 0;
    int natural = 0;
    int factors = 0;

    while (factors < 500) {

        factors = 0;

        natural++;
        triangle += natural;

        for (long i = 1; i <= sqrt(triangle); i++) {
            if (triangle % i == 0) factors += 2;
        }

    }
    std::cout << triangle << std::endl;
    
    return 0;
}