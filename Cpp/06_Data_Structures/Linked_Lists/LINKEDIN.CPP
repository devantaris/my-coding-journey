//insertion in a linked list
#include<iostream.h>
#include<conio.h>
#include<alloc.h>
#include<stdlib.h>


 struct node
 {
  int x;
  struct node *ptr;
 };

struct node *first = '\0';

   void insertatbegin(int n)
   {
       struct node *p;
       p= (struct node *)malloc(4);
       p -> x = n;
       if (first == '\0')
	   p -> ptr = '\0';
       else
	   p -> ptr = first;
       first = p;
   }
   void insertatmid(int data)
   {
       int pos;
       cout<<"Enter the position to insert the new node: ";
       cin>>pos;
       cout<<"Enter the data to be inserted: ";
       cin>>data;

       struct node *p, *temp;
       p = (struct node *)malloc(4);
       p -> x = data;

       if (pos == 1)
       {
	   p -> ptr = first;
	   first = p;
       }
       else
       {
	   temp = first;
	   for (int i = 1; i < pos - 1 && temp != '\0'; i++)
	       temp = temp -> ptr;
	   if (temp == '\0')
	       cout<<"Position out of bounds\n";
	   else
	   {
	       p -> ptr = temp -> ptr;
	       temp -> ptr = p;
	   }
       }
   }
   void insertatend(int n)
   {
       struct node *p, *temp;
       p = (struct node *)malloc(4);
       p -> x = n;
       p -> ptr = '\0';
       if (first == '\0')
	   first = p;
       else
       {
	   temp = first;
	   while (temp -> ptr != '\0')
	       temp = temp -> ptr;
	   temp -> ptr = p;
       }
   }
   void display()
   {
       struct node *temp;
       temp = first;
       if (temp == '\0')
	   cout<<"List is empty\n";
       else
       {
	   cout<<"The linked list is: ";
	   while (temp != '\0')
	   {
	       cout<<temp -> x<<" ";
	       temp = temp -> ptr;
	   }
	   cout<<"\n";
       }
   }

void main()
{
 char ch,chh;
 struct node *start, * temp;
 clrscr();
 do{
    start = (struct node *)malloc(4);
    cout<<"Enter the info in new node: ";
    cin>>start -> x;
    if (first == '\0')
    {
     first = start ;
     temp = start;
    }
    else
    {
     temp -> ptr = start;
     temp = start;
    }
    cout<<"Do you want to continue adding nodes and data Y/N: ";
    cin>>ch;
   }while(ch=='y');

   do {
   cout<<"Enter your choice:\n";
   cout<<"1. Insert at beginning\n";
   cout<<"2. Insert at middle\n";
   cout<<"3. Insert at end\n";
   cout<<"4. Display\n";
   cout<<"5. Exit\n";
   int choice;
   cin>>choice;
   switch(choice)
   {
       case 1:
	   cout<<"Enter the data to insert at beginning: ";
	   int data;
	   cin>>data;
	   insertatbegin(data);
	   break;
       case 2:
	   cout<<"Enter the data to insert at middle: ";
	   int mid_data;
	   cin>>mid_data;
	   insertatmid(mid_data);
	   break;
       case 3:
	   cout<<"Enter the data to insert at end: ";
	   int end_data;
	   cin>>end_data;
	   insertatend(end_data);
	   break;
       case 4:
	   display();
	   break;
       case 5:
	   exit(0);
       default:
	   cout<<"Invalid choice\n";
   }
   cout<<"Do you want the menu again? y/n: ";
   cin>> chh;
   }while (chh == 'y');
   getch();
}