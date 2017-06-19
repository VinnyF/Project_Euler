#include <iostream>
#include <vector>

int main() {
    int sum = 0;
    std::vector<int> multiples;

    for (int i = 1; i <= 1000; i++) {   //Store all the multiples in a vector
        if (i%3 == 0 || i%5 == 0)
            multiples.push_back(i);
    }

    for (int i = 0; i < multiples.size(); i++) { //Find sum of values in vector
        sum += multiples[i];
    }

    std::cout << sum << std::endl;
}