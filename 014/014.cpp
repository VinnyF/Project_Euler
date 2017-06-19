#include <iostream>

long collatz(long sequence) {
    if (sequence == 1) return 1;
    if (sequence % 2 == 0) return collatz(sequence/2) + 1;
    else return collatz((3*sequence)+1) + 1;
}

int main() {

    long longest = 0;
    long starting;

    for (long i = 1; i <= 1000000; i += 2) {
        long check = collatz(i);
        if (check > longest) {
            longest = check;
            starting = i;
        }
    }

    std::cout << starting << std::endl;

    return 0;
}