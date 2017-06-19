#include <iostream>
#include "Date.h"

//Taking this problem as an exercise in writing a date class

int main() {

    int answer = 0;
    for (Date date(1901,0,0); date.getYear() != 2001; date++) {
        if (date.getDay() == 1 && date.getWeekday() == "Sunday") answer++;
    }

    std::cout << answer << std::endl;

    return 0;
}