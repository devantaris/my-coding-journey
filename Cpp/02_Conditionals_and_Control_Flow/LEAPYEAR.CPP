//leap year
#include<iostream.h>
#include<conio.h>
void main()
{
int yr;
clrscr();
cout<<"Enter any year to check: ";
cin>>yr;
if (yr%4==0)
cout <<yr<<" is a leap year";
else
cout<<yr<<" is not a leap year";
getch();
}