/* 
Think of each positon on the grid as a number from 0 counting up,
from left to right, then top to bottom.
This avoids the need for a 2D array
*/

#include <iostream>
#include <unordered_map>

long long down_and_right(std::unordered_map<int,long long> &memory, int width, int height, int position = 0) {
    long long answer = 0;
    if (position == (width*height) - 1) return answer + 1;

    //If the position has been visited previously in the program, the answer is already known
    if (memory.find(position) != memory.end()) return memory[position];

    if ((position+1)%width != 0) //If at right edge, can't move right
        answer += down_and_right(memory,width,height,position+1); //Move right

    if (position + width < width*height) //If on last row, can't move down
        answer += down_and_right(memory,width,height,position+width); //Move down

    memory[position] = answer; //Save answer for current position.
    return answer; //can't do anything
}

int main() {

    std::unordered_map<int,long long> memory;

    std::cout << down_and_right(memory,21,21) << std::endl;

    return 0;
}
