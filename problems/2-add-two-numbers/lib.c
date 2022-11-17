#include <stdlib.h>
#include "lib.h"

struct ListNode* addTwoNumbers(struct ListNode* l1, struct ListNode* l2) {
    struct ListNode* current = NULL;
    struct ListNode* first_node = NULL;

    int reminder = 0;
    while (l1 != NULL || l2 != NULL || reminder != 0) {
        // Read digits
        int a = 0;
        int b = 0;
        if (l1 != NULL)
            a = l1->val;
        if (l2 != NULL)
            b = l2->val;

        // Move pointers to the next node
        if (l1 != NULL)
            l1 = l1->next;
        if (l2 != NULL)
            l2 = l2->next;

        // Calculate the result
        int digit = (a + b + reminder) % 10;
        reminder = (a + b + reminder) / 10;

        // Create the first node
        if (current == NULL) {
            current = malloc(sizeof(struct ListNode));
            first_node = current;
        }
        // Create regular node
        else {
            current->next = malloc(sizeof(struct ListNode));
            current = current->next;
        }

        // Save the result
        current->val = digit;
        current->next = NULL;
    }
    
    return first_node;
}
