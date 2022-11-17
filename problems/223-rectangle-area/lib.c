#include "lib.h"

int _findIntersection(int a_start, int a_end, int b_start, int b_end) {
    // aaaa
    //   bbbb
    if (a_end > b_start && a_start <= b_start && a_end <= b_end)
        return a_end - b_start;
    //   aa
    // bbbbbb
    if (a_start >= b_start && a_end <= b_end)
        return a_end - a_start;
    //   aaaa
    // bbbb
    if (a_start >= b_start && a_start < b_end && a_end >= b_end)
        return b_end - a_start;
    // aaaaa
    //  bb
    if (b_start >= a_start && b_end <= a_end)
        return b_end - b_start;
    return 0;
}

int computeArea(int ax1, int ay1, int ax2, int ay2, int bx1, int by1, int bx2, int by2) {
    // Area of the first rectangle
    int a = (ax2 - ax1) * (ay2 - ay1);

    // Area of the second rectangle
    int b = (bx2 - bx1) * (by2 - by1);

    // Find intersection
    int x_intersection = _findIntersection(ax1, ax2, bx1, bx2);
    int y_intersection = _findIntersection(ay1, ay2, by1, by2);

    return a + b - x_intersection * y_intersection;
}
