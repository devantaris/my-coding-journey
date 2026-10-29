//sum of digits of a number
#include<stdio.h>
#include<conio.h>
#include<iostream.h>
void main()
{
int s,n,r;
clrscr();
cout<<"enter the integer: ";
cin>>n;
s=0;
i=1;
while(n!=0)
  {
  r=n%10;
  s=r+s;
  n=n/10;
  }
cout<<s;
getch();
}