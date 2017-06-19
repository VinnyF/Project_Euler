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

    long number = 600851475143;
    long prime_factor = 2;

    bool stop = false;
    while(1) {
        if (is_prime(prime_factor)) {
            while (number % prime_factor == 0) { //is a prime factor
                number /= prime_factor;
                if (is_prime(number)) stop = true;
            }
            if (stop) break;
        }
        prime_factor++;
    }

    std::cout << number << std::endl;

    return 0;
}