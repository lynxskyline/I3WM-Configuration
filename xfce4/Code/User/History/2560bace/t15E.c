#include <stdio.h>

int main() {
    int num[] = {1, 2, 3, 4, -6, 0, 7};
    int length = sizeof(num) /sizeof(num[0]);
    int i;

    for (i = 0; i < length; i++) {
        if (num[i] < 0) {
            continue;
        }
        if (num[i] == 0) {
            break;
        }
        printf("%d\n", num[i]);
    }
}
