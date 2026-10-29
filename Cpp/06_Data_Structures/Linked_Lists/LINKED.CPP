#include<iostream.h>
#include<conio.h>
#include<alloc.h>

void main()
{
  char ch;
  struct node
    {
     int x;
     struct node *ptr;
    };
  struct node *start, *first , *temp;
  clrscr();
  first = '\0';
  cout<<"Program for LINKED LIST STARTED\n";
  do{
     cout<<"Enter a value in your linked list: ";
     start= (struct node *)malloc(4);
     cin>>start->x;
     if(first!='\0')
      {
       temp->ptr=start;
       temp=start;
      }
     else
      {
       first = start;
       temp = start;
      }
      cout<<"\nDo you want to continue y or n: ";
      cin>>ch;

  }while(ch=='y');
  temp -> ptr = '\0';
  temp = first;
  while(temp!='\0')
  {
   cout<<temp-> x<<" ";
   temp = temp -> ptr;
  }
  getch();
}