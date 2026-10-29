#include<iostream.h>
#include<conio.h>

class clndr
{
  int yr,m;
 public:
  clndr()
   {}
  clndr(int x,int y)
   {
   m=x;
   yr=y;
   }
  void add(clndr x, clndr y)
   {
   yr=x.yr+y.yr;
   m=x.m+y.m;
   }
  void display()
   {
   cout<<m<<"-"<<yr<<"\n";
   }
};

void main()
{
clndr c1(3,2004), c2(5,2024), c3;
clrscr();
c3.add(c1,c2);
c1.display();
c2.display();
cout<<"--------------\n";
c3.display();
getch();
}
