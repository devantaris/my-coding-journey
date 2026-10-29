//smallest among three numbers
#include<iostream.h>
#include<conio.h>
void main()
{
int a,b,c;
clrscr();
cout<<"Enter three integrs: ";
cin>>a>>b>>c;
if (a<b)
  {
    if (a<c)
     cout <<a<<" is the smallest";
    else
     cout<<c<<" is the smallest";
  }
else
  {
   if(b<c)
     cout<<b<<" is the smallest";
   else
     cout<<c<<" is the smallest";
  }
getch();
}