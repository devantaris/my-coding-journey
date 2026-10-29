//sum of 2,3,4,5 numbers
#include<stdio.h>
#include<conio.h>
#include<iostream.h>
area (int a)
{
return(a*a);
}
area (int a,int b)
{
return (a*b);
}
   void main()
   {
   int p,q,a,b;
   clrscr();
   cout<<"Enter 2 integers: ";
   cin>>a>>b;
   p=area(a);
   q=area(a,b);
   cout<<"area ofsquare is: "<<p;
   cout<<"\narea of recatamgle is: " <<q;
   getch();
   }
