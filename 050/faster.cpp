#include <iostream>
#include <set>
#include "prime.h"

//For this solution, I had to remake the prime functions in C++, stored in prime.h

/*
This is the first time a problem forced me to seriously optimize and reconsider my strategy.
My previous solution for Haskell will most likely work, since it does for smaller numbers, but simply takes to long
for primes under 1 million.

First I tried the method in consecutiveprimesum.hs
Getting a list of the list of primes up to x, up to 1 million
Then breaking down each list to search for a sequence adding up to x
After running for 24 hours, I had to give up.

I then thought a completely different idea. 
Take the list of primes
Start with n = the size of the list
Take the sum of n sequential numbers, starting at the first number
Then take the sum of n sequential numbers, starting at the second number,
    continue until the the starting point and n is the size of the entire list
Then, decrease n and try again until the sum is less than 1000000 and also prime_sieve

Due to the way lists work in Haskell, it takes an incredibly long time to iterate through ranges of a list
I had trouble thinking of a way to optimally implement this algorithm without having to constantly build and rebuild lists

So, I tried implementing it in C++, and came up with this.
It takes less than 10 seconds to run, with most of the time being spent initializing the vector and set
*/

//Takes the vector of numbers, the starting point and the end point
//and returns the sum of the numbers in that range
long getSum(int low, int high, std::vector<int> &numbers) {
    long sum = 0;
    for (int i = low; i < high; i++) {
        sum += numbers[i];
    }
    return sum;
}

int main() {

    //Get all primes below 1 million
    std::vector<int> primes = prime_sieve(1000000);

    unsigned int size = primes.size();
    unsigned int range = size;

    //Store the vector of primes in a tree
    //This will speed up time later
    std::set<int> primeset;
    for (unsigned int i = 0; i < size; i++)
        primeset.insert(primes[i]);

    int answer = 0;
    bool found = false;

    while (range > 1 && !found) {

        //Get the sum in the given range
        for (int low = 0; low+range <= size; low++) {
            long sum = getSum(low,low+range,primes);

            //If the sum is greater than 1 million,
            //The next sum in the given range is guaranteed to also be greater than 1 million
            //So, can safely move on to the next range
            if (sum > 1000000) break;

            //Searches the tree of primes to see if the sum is prime
            //This has log(n) time, which is much faster than using the is_prime method
            if (primeset.find(sum) != primeset.end()) {
                answer = sum;
                found = true;
                break;
            }
        }
        range--;
    }

    std::cout << answer << std::endl;
    
    return 0;
}