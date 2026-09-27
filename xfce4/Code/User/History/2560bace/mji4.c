#include <stdio.h>

int main() {
    int x = 15;

    if (x < 12) {
        printf("masih pagi\n");
    } else if (x < 15) {
        printf("sudah siang\n");
    } else if (x > 15) {
        printf("sudah malam\n");
    }
}