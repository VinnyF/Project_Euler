#include <iostream>

int main() {
    
    int answer = 2520;
    bool done = false;

    while(!done) {
        
        answer += 20;
        for (int i = 1; i <= 20; i++) {
            if (answer % i == 0) done = true;
            else {
                done = false;
                break;
            }
        }
    }

    std::cout << answer << std::endl;
}