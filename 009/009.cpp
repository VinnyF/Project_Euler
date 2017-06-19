#include <iostream>

int main() {

    int answer;

    bool found = false;

    for (int a = 1; a < 1000; a++) {
        if(found) break;

        for (int b = 1; b < 1000; b++) {
            if (a > b) continue;
            if (found) break;

            for (int c = 1; c < 1000; c++) {
                if (b > c) continue;
                if (found) break;

                if ((a + b + c) == 1000) {
                    long a_2 = a*a;
                    long b_2 = b*b;
                    long c_2 = c*c;

                    answer = a*b*c;
                    if (a_2 + b_2 == c_2) found = true;
                }
            }
        }
    }
    std::cout << answer << std::endl;
}