#include <iostream>

int ones(int x) {
    switch (x) {
        case 1: return 3; //one
        case 2: return 3; //two
        case 3: return 5; //three
        case 4: return 4; //four
        case 5: return 4; //five
        case 6: return 3; //six
        case 7: return 5; //seven
        case 8: return 5; //eight
        case 9: return 4; //nine
        default: return 0;
    }
}

int teens(int x) {  //this part feels unnecessary
    switch (x) {
        case 10: return 3; //ten
        case 11: return 6; //eleven
        case 12: return 6; //twelve
        case 13: return 8; //thirteen
        case 14: return 8; //fourteen
        case 15: return 7; //fifteen
        case 16: return 7; //sixteen
        case 17: return 9; //seventeen
        case 18: return 8; //eighteen
        case 19: return 8; //nineteen
        default: return 0;
    }
}

int tens(int x) {
    switch (x) {
        case 2: return 6; //twenty
        case 3: return 6; //thirty
        case 4: return 5; //forty
        case 5: return 5; //fifty
        case 6: return 5; //sixty
        case 7: return 7; //seventy
        case 8: return 6; //eighty
        case 9: return 6; //ninety
        default: return 0;
    }
}

int hundreds(int x) {
    if (x % 100 == 0) return ones(x/100) + 7; //hundred
    else return ones(x/100) + 10; //hundred and
}

int main() {

    int result = 0;

    for (unsigned int i = 1; i <= 1000; i++) {

        if (i == 1000) result += 11; //one thousand

        else if (i/100 > 0) { //3 digits
            result += hundreds(i);
            if (i%100 < 20 && i%100 >= 10) result += teens((i%100));
            else {
                result += tens((i%100) / 10);
                result += ones(i % 10);
            }
        }

        else if (i/10 > 0) { //2 digits
            if (i < 20) result += teens(i);
            else {
                result += tens(i/10);
                result += ones(i%10);
            }
        }

        else result += ones(i);
    }

    std::cout << result << std::endl;
}