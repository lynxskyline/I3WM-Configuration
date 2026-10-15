#include <stdio.h>

int main() {
    int x = 5;

    if (x < 12) {
        printf("masih pagi\n");
    } else if (x < 15) {
        printf("sudah siang\n");
    } else {
        printf("sudah malam\n");
    }
}