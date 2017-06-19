#include <iostream>
#include <vector>

int main() {

    int previous = 1;
    int next = 2;
    int temp;

    int sum = 0;

    std::vector<int> evens;

    while (next < 4000000) {
        if (next % 2 == 0)  //add to vector if even
            evens.push_back(next);

        temp = next;    //advance the sequence
        next += previous;
        previous = temp;
    }

    for (unsigned int i = 0; i < evens.size(); i++) //get sum of vector
        sum += evens[i];

    std::cout << sum << std::endl;
}