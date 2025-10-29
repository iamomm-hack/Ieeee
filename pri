#include <stdio.h>
#include <stdlib.h>
#define MS 100

int arr[MS];
int rear = -1;

void enqueue(int val) {
    int p, c, t;
    if (rear == MS - 1) {
        printf("Heap is full\n");
        return;
    }
    rear++;
    arr[rear] = val;
    c = rear;
    while (c > 0) {
        p = (c - 1) / 2;
        if (arr[p] < arr[c]) {
            t = arr[p];
            arr[p] = arr[c];
            arr[c] = t;
            c = p;
        } else break;
    }
}

int dequeue() {
    int val, p, c, t;
    if (rear == -1) return -99999;
    val = arr[0];
    arr[0] = arr[rear];
    rear--;
    p = 0;
    while (p <= rear) {
        c = 2 * p + 1;
        if (c > rear) break;
        if (c + 1 <= rear && arr[c] < arr[c + 1]) c = c + 1;
        if (arr[p] < arr[c]) {
            t = arr[p];
            arr[p] = arr[c];
            arr[c] = t;
            p = c;
        } else break;
    }
    return val;
}

int main() {
    int ch, val;
    while (1) {
        printf("\n1. Enqueue\n2. Dequeue\n3. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &ch);
        switch (ch) {
            case 1:
                printf("Enter value to enqueue: ");
                scanf("%d", &val);
                enqueue(val);
                break;
            case 2:
                val = dequeue();
                if (val == -99999)
                    printf("Heap is empty!\n");
                else
                    printf("Dequeued value = %d\n", val);
                break;
            case 3:
                exit(0);
            default:
                printf("Try Again...\n");
        }
    }
    return 0;
}