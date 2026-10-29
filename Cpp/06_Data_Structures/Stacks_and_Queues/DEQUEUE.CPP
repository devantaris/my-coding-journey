#include <iostream.h>
#include <conio.h>

int dequeue[5], front = -1, rear = -1;
void insert(int value) {
    if (rear == 4) {
	cout << "Queue is full";
    }
    else if(rear<4){
	if(rear ==-1){
	    rear = front = 0;
	}
	else{
	    rear++;
    }
    else if ( front>0){
	front -=1;
    }
	dequeue[rear] = value;
}
void deleteElement() {
    if (front == -1) {
	cout << "Queue is empty";
    }
    else if (front == rear){
	front =-1;
	rear =-1;
    }
     else {
	cout << "Deleted element: " << dequeue[front];
	front++;
    }
}
void display() {
	cout << "Queue elements: ";
	for (int i = front; i <= rear; i++) {
	    cout << dequeue[i] << " ";
	}
}
void main() {
    int choice, value;
    clrscr();
    do {
	cout << "1. Insert\n2. Delete\n3. Display\n4. Exit\n";
	cout << "Enter your choice: ";
	cin >> choice;
	switch (choice) {
	    case 1:
		cout << "Enter value to insert: ";
		cin >> value;
		insert(value);
		break;
	    case 2:
		deleteElement();
		break;
	    case 3:
		display();
		break;
	    case 4:
		cout << "Exiting...";
		break;
	    default:
		cout << "Invalid choice";
	}
    } while (choice != 4);
    getch();
}