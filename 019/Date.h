#ifndef _Date_h_
#define _Date_h_
#include <string>

class Date {

    public:
    
    Date(int year_ = 1900, int month_ = 0, int day_ = 0);
    Date& operator++();
    Date operator++(int);
    Date& operator--();
    Date operator--(int);
    Date& operator=(const Date& old);

    bool isLeapYear() {return limits[1] == 29;}
    int getYear() {return year;}
    int getMonth() {return month + 1;}
    int getDay() {return day + 1;}
    std::string getWeekday() {return weekdays[weekday];}

    private:

    int year;
    int month;
    int day;

    int weekday;
    std::string weekdays[7] {"Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"};

    int limits[12] {31,28,31,30,31,30,31,31,30,31,30,31};
};

Date& Date::operator=(const Date& old) {
    year = old.year;
    month = old.month;
    day = old.day;
    weekday = old.weekday;

    return *this;
}

Date& Date::operator--() {
    weekday--;
    if (weekday < 0) weekday = 6;

    day--;
    if (day < 0) {
        month--;
        if (month < 0) {
            year--;
            month = 11;
            if ((year % 4 == 0) || ((year % 100 == 0) && (year % 400 == 0)))
                limits[1] = 29; //leap year
            else limits[1] = 28; //not a leap year            
        }
        day = limits[month] - 1;
    }
    return *this;
}

Date Date::operator--(int) {
    Date temp(*this);
    --(*this);
    return temp;
}

Date& Date::operator++() {
    weekday++;
    if (weekday >= 7) weekday = 0;

    day++;
    if (day >= limits[month]) {
        month++;
        day = 0;
        if (month >= 12) {
            year++;
            month = 0;
            if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0))
                limits[1] = 29; //leap year
            else limits[1] = 28; //not a leap year
        }
    }
    return *this;
}

Date Date::operator++(int) {
    Date temp(*this);
    ++(*this);
    return temp;
}

Date::Date(int year_, int month_, int day_) {
    year = 1900;
    month = 0;
    day = 0;
    weekday = 1;

    //Must de/increment to the desired date from the default of January 1, 1990
    //In order to keep track of the day of the week 
    if (year_ < year)
        while (year != year_ && month != month_ && day != day_) (*this)--;

    else if (year_ > year)
        while (year != year_) (*this)++;

        if (month_ > month)
            while (month != month_) (*this)++;

            if (day_ > day)
                while (day != day_) (*this)++;

}

#endif