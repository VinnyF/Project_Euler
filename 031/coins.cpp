#include <iostream>

int main() {

    int arr[201] = { };
    arr[0] = 1;

    int coins[8] = {1,2,5,10,20,50,100,200};

    for (int k = 0; k < 8; k++) {
        for (int i = 0; i < (201-coins[k]); i++) {
            arr[i+coins[k]] += arr[i];
        }
    }

    std::cout << arr[200] << std::endl;
}