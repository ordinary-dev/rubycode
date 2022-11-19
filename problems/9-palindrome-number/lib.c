#include "lib.h"

bool isPalindrome(int x) {
    if (x < 0)
        return false;

    // Find length and calculate divisor
    int len = 0;
    int div = 1;
    int copy = x;
    while (copy > 0) {
        copy /= 10;
        if (len != 0)
            div *= 10;
        len++;
    }

    // Compare digits
    for (int i=0; i<len/2; i++) {
        int a = x / div;
        int b = x % 10;
        if (a != b)
            return false;
        
        // Remove first and last digit
        x = x % div;
        x /= 10;
        div /= 100;
    }

    return true;
}
