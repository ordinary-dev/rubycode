#include "stdio.h"
#include "stdlib.h"
#include "lib.h"

int main() {
    int returnSize = -1;
    
    int nums1[] = {2, 7, 11, 15};
    int target1 = 9;
    int* res1 = twoSum(nums1, 4, target1, &returnSize);
    if (returnSize == 2 && res1[0] == 0 && res1[1] == 1) {
        printf("Test 1: passed\n");
    }
    else {
        printf("Test 1: failed\n");
    }
    if (returnSize > 0) {
        free(res1);
    }

    int nums2[] = {3, 2, 4};
    int target2 = 6;
    int* res2 = twoSum(nums2, 3, target2, &returnSize);
    if (returnSize == 2 && res2[0] == 1 && res2[1] == 2) {
        printf("Test 2: passed\n");
    }
    else {
        printf("Test 2: failed\n");
    }
    if (returnSize > 0) {
        free(res2);
    }
    
    return 0;
}
