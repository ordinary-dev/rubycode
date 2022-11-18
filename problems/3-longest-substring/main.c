#include <stdio.h>
#include "lib.h"

int main() {
    printf("Space: %d, z: %d\n", ' ', 'z');
    char* s1 = "abcabcbb";
    int res1 = lengthOfLongestSubstring(s1);
    printf("Test 1: %d\n", res1 == 3);

    char* s2 = "bbbbb";
    int res2 = lengthOfLongestSubstring(s2);
    printf("Test 2: %d\n", res2 == 1);

    char* s3 = "pwwkew";
    int res3 = lengthOfLongestSubstring(s3);
    printf("Test 3: %d\n", res3 == 3);
    
    char* s4 = "";
    int res4 = lengthOfLongestSubstring(s4);
    printf("Test 4: %d\n", res4 == 0);

    char* s5 = "a";
    int res5 = lengthOfLongestSubstring(s5);
    printf("Test 5: %d\n", res5 == 1);

    return 0;
}
