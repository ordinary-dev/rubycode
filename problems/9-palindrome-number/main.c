#include <stdio.h>
#include "lib.h"

int main() {
    int a = 121;
    printf("Test 1: %d\n", isPalindrome(a) == 1);

    int b = -121;
    printf("Test 2: %d\n", isPalindrome(b) == 0);

    int c = 1234554321;
    printf("Test 3: %d\n", isPalindrome(c) == 1);

    int d = 2147483647;
    printf("Test 4: %d\n", isPalindrome(d) == 0);

    return 0;
}
