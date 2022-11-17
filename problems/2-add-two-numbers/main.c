#include <stdlib.h>
#include <stdio.h>
#include "lib.h"

// Creates single node
struct ListNode* mkNode(int val) {
    struct ListNode* node = malloc(sizeof(struct ListNode));
    node->val = val;
    node->next = NULL;
    return node;
}

// Creates linked list
struct ListNode* mkList(int* nums, int length) {
    struct ListNode* first = NULL;
    struct ListNode* current = NULL;
    for (int i=0; i<length; i++) {
        // First node
        if (current == NULL) {
            current = mkNode(nums[i]);
            first = current;
        }
        // Regular node
        else {
            current->next = mkNode(nums[i]);
            current = current->next;
        }
    }
    return first;
}

// Returns 1 if linked lists are equal.
// Returns 0 otherwise.
int cmpLists(struct ListNode* a, struct ListNode* b) {
    while (a != NULL || b != NULL) {
        // Both nodes exist
        if (a == NULL || b == NULL)
            return 0;

        // Check values
        if (a->val != b->val)
            return 0;
        
        // Go to next node
        a = a->next;
        b = b->next;
    }

    return 1;
}

// Free allocated memory
void freeLinkedList(struct ListNode* list) {
    struct ListNode* current;
    while (list != NULL) {
        current = list;
        list = list->next;
        free(current);
    }
}

int main() {
    // First list
    int a[] = {2, 4, 3};
    struct ListNode* list_a = mkList(a, 3);

    // Second list
    int b[] = {5, 6, 4};
    struct ListNode* list_b = mkList(b, 3);

    // Expected sum
    int c[] = {7, 0, 8};
    struct ListNode* list_c = mkList(c, 3);

    // Computed result
    struct ListNode* res = addTwoNumbers(list_a, list_b);

    printf("Test 1: %d\n", cmpLists(res, list_c));

    freeLinkedList(list_a);
    freeLinkedList(list_b);
    freeLinkedList(list_c);
    freeLinkedList(res);

    return 0;
}
