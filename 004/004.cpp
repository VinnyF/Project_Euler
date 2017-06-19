#include <iostream>
#include <sstream>
#include <string>
#include <stdlib.h>
#include <algorithm>
#include <vector>

int main() {

    std::vector<long> answers;
    long reversed = 0;

    for (int i = 999; i >= 100; i--) {

        for (int j = 999; j >= 100; j--) {

            long product = i*j;

            std::stringstream stream;
            stream << product;
            std::string str = stream.str();

            reverse(str.begin(),str.end());

            reversed = std::atol(str.c_str());

            if (product == reversed) answers.push_back(reversed);
            
        }

    }

    long solution = 0;
    for (unsigned int i = 0; i < answers.size(); i++) {
        if (answers[i] > solution) solution = answers[i];
    }

    std::cout << solution << std::endl;
}