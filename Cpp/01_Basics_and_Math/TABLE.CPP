//table of any number
#include<stdio.h>
#include<conio.h>
#include<iostream.h>
void main()
{
int i,n,m;
clrscr();
cout<<"table of:";
cin>>n;
i=1;
while(i<=10)
	{
	m=n*i;
	cout<<"\n"<<m;
	i=i+1;
	}
getch();
}