#include <iostream>

int main() {

    long square_sum = 0;
    long sum_square = 0;

    for (int i = 1; i <= 100; i++) {
        sum_square += i*i;
        square_sum += i;
    }

    square_sum *= square_sum;

    std::cout << square_sum-sum_square << std::endl;
}