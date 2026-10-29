//sum of integers until n
#include<stdio.h>
#include<conio.h>
#include<iostream.h>
void main()
{
int i,n,sum;
clrscr();
cout<<"enter the integer: ";
cin>>n;
sum=0;
i=1;
while(i<=n)
	{
	sum=sum+i;
	i=i+1;
	}
cout<<sum;
getch();
}