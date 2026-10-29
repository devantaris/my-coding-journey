#include<iostream.h>
#include<conio.h>
//#include<stdlib.h>
  #include<process.h>
 #define n 10
int  TOS=-1, s[n];

void push()
{
	if (TOS==n-1){
		cout<<"\nStack Overflow";
		exit(0);
		}
	else{
		TOS +=1;
		int value;
		cout << "\nEnter the value: ";
		cin >> value;
		s[TOS] = value;
		}
	}
void pop()
{
	if (TOS==-1){
		cout<<"\nStack Empty";
		exit(0);
		}
	else
	{
		int value = s[TOS];
		TOS -=1;
	}
 }
void display()
	{
	for (int i =TOS; i>=0; i--)
		{
		cout<<s[i]<<" ";
		}
	}
void main()
{        char ch;
	int m;
	do{
	cout<<"Enter the choice of 1,2,3 for push,pop,display: ";
	cin>>m;
	switch(m)
	{
		case 1: push();
			break;
		case 2: pop();
			break;
		case 3: display();
			break;
		default: cout<<"Invalid";

	}

}

