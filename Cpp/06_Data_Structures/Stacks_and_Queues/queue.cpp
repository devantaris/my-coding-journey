#include<iostream>
#include<conio.h>
#include<stdlib.h>

int front = -1, rear = -1;
#define n 10
int queue[n];

void enqueue() {
    if (rear == n - 1) {
        cout << "\nQueue Overflow";
        exit(0);
    } else if (rear == -1 && front == -1) {
        front = 0;
        rear = 0;
    } else {
        rear += 1;
    }
    int value;
    cout << "\nEnter the value: ";
    cin >> value;
    queue[rear] = value;
}
void 