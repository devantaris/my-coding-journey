#include<iostream.h>
#include<conio.h>

class date
{
  int yr,m,day;
 public:
  date()
   {}
  date(int x,int y,int z)
   {
   yr=x;
   m=y;
   day=z;
   }
  friend date age(date c, date b)
   {
   date a;
    if (c.day<b.day)
    {
       a.day=c.day+30-b.day;
       c.m--;
    }
    else
       a.day=c.day-b.day;

   if (c.m<b.m)
     {
      a.m=c.m+12-b.m;
      c.yr=c.yr-1;
      }
   else
      a.m=c.m-b.m;

   a.yr=c.yr-b.yr;

   return(a);
   }

  void display()
   {
   cout<<"age is "<< yr<<" years "<<m<<" months and "<<day<<" days";
   }
};

void main()
{
date b(2005,10,3), c(2024,7,22), a;
clrscr();
a=age(c,b);
a.display();
getch();
}
