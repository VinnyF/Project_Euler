#ifndef _prime_h_
#define _prime_h_

#include <vector>
#include <math.h>

//Brute force check
bool is_prime(long num) {
    if (num < 2) return false; //Handles 1 and negative numbers
    for (int i = 2; i <= sqrt(num); i++) {
        if (num % i == 0) return false;
    }
    return true;
}

//Uses the method of the Sieve of Eratosthenes
std::vector<int> prime_sieve(long max) {

    //Initialize vector of true bools from 0 to the number specified
    std::vector<bool> all_numbers(max+1,true);
    all_numbers[0] = all_numbers[1] = false; //These need to be set to false

    //If a number is reached and is true, it must be prime
    //If any number past it is divisible by it, that number must not be prime
    for (long i = 0; i <= sqrt(max+1); i++)
        if (all_numbers[i] == true)
            for (long j = i+1; j < max; j++)
                if (j % i == 0) all_numbers[j] = false;

    //Take the bool vector and consolidate the true values into one vector
    std::vector<int> primes;
    for (long i = 0; i < max; i++)
        if (all_numbers[i] == true)
            primes.push_back(i);

    return primes;
}

#endif