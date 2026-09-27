#include <stdio.h>

int main() {
    int jam = 15;

    if ( jam < 12 ) {
        printf("masih pagi\n");
    } else if ( jam < 15 ) {
        printf("sudah siang\n");
    } else if ( jam > 18 ) {
        printf("sudah malam\n");
    }
}