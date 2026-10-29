//largest among three numbers
#include<iostream.h>
#include<conio.h>
void main()
{
int a,b,c;
clrscr();
cout<<"Enter three integrs: ";
cin>>a>>b>>c;
if (a>b)
  {
    if (a>c)
     cout <<a<<" is the largest";
    else
     cout<<c<<" is the largest";
  }
else
  {
   if(b>c)
     cout<<b<<" is the largest";
   else
     cout<<c<<" is the largest";
  }
getch();
}