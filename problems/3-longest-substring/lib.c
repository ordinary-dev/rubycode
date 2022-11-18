#include <string.h>
#include "lib.h"

void resetArray(int* count) {
    int length = '~' - 32 + 1;
    for (int i=0; i<length; i++) {
        count[i] = 0;
    }
}

int lengthOfLongestSubstring(char * s) {
    // Create an array to count every symbol
    // '~' is one of the last symbols in ascii table (except DEL)
    int count['~' - 32 + 1];
    resetArray(count);
    
    int len = strlen(s);
    // Start of the current sequence
    int start = 0;
    // Result will be stored here
    int maxlen = 0;

    while (start < len) {
        // End of the current sequence
        int end = start;

        while (end < len) {
            // Calculate index in array
            int ch = s[end] - 32;
            // Symbol repeated
            if (count[ch] == 1) {
                // Fill array with 0
                resetArray(count);
                // Save max length
                int newmaxlen = end - start;
                if (newmaxlen > maxlen)
                    maxlen = newmaxlen;
                // Move to the next sequence
                start++;
                end = start;
            }
            else {
                // Save the symbol
                count[ch]++;
                // Move to the next symbol
                end++;
            }
        }
        // Save max length
        int newmaxlen = end - start;
        if (newmaxlen > maxlen)
            maxlen = newmaxlen;
        // Move to the next sequence
        start++;
        end = start;
    }

    return maxlen;
}
