#include <iostream>
#include <math.h>



bool is_prime(long num) {    //brute force check if number is prime
    if (num == 2 || num == 3 || num == 5) return true;
    for (int i = 2; i <= sqrt(num); i++) {
        if (num % i == 0) return false;
    }
    return true;
}



int main() {
    long sum = 0;

    for (long i = 2; i < 2000000; i++) {
        if (is_prime(i)) sum += i;
    }

    std::cout << sum << std::endl;
}