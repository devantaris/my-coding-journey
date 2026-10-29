//cyclic queue

#include<iostream.h>
#include<conio.h>
#include<stdlib.h>

int front = -1, rear = -1;
#define n 10

int queue[n];

void insert_queue() {
    if ((rear == n - 1 && front == 0)|(rear ==  front-1))
    {
	cout << "\nCyclic Queue Overflow";
    }
    else if (rear == -1 && front == -1) {
	front = 0;
	rear = 0;
	int value;
	cout << "\nEnter the value: ";
	cin >> value;
	queue[rear] = value;
    }
    else if (rear == n-1)
    {
	rear = 0;
	int value;
	cout << "\nEnter the value: ";
	cin >> value;
	queue[rear] = value;
    }
    else
    {
	rear += 1;
	int value;
	cout << "\nEnter the value: ";
	cin >> value;
	queue[rear] = value;
    }
}
void delete_queue(){
    if (front == -1){
       cout<< "\nCyclic Queue Underflow";
    }
    int value;
    value = queue[front];
    if (front == rear){
       front = -1;
       rear = -1;
    }
    else if(front == n-1){
       front = 0;
    }
    else {
       front +=1;
    }
    cout<<"\n"<<value<<" is Deleted.";
}
void display(){
    if (front<=rear)
    {
      for (int i = front; i<=rear; i++)
	{
	cout<<queue[i]<<" ";
	}
    }
    else if (rear<front)
    {
      for(int i = front ; i<n ;i++)
	{
	cout<<queue[i]<<" ";
	}
      for(i = 0 ; i<=rear; i++)
	{
	cout<<queue[i]<<" ";
	}
    }

}

void main(){
	char ch ;
	int m ;
	clrscr();
	do {
	    cout<<"Enter choice 1,2,3: ";
	    cin>>m;
	    switch(m){
		case 1: insert_queue();
			break;
		case 2: delete_queue();
			break;
		case 3: display();
			break;
		default: cout<<"Invalid input.";
		}
	    cout<<"\nDo you want to continue? y or n: ";
	    cin>>ch;
	    } while (ch=='y');
getch();
}
