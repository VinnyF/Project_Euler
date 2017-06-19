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
    int ith_prime = 0;
    long prime = 1;

    while(ith_prime < 10001) {

        prime++;
        if (is_prime(prime)) ith_prime++;
        
    }

    std::cout << prime << std::endl;
}