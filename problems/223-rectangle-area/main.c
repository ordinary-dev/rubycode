#include <stdio.h>
#include "lib.h"

int main() {
    int res1 = computeArea(-3, 0, 3, 4, 0, -1, 9, 2);
    printf("Test 1: %d\n", res1 == 45);

    int res2 = computeArea(-2, -2, 2, 2, -2, -2, 2, 2);
    printf("Test 2: %d\n", res2 == 16);

    return 0;
}
