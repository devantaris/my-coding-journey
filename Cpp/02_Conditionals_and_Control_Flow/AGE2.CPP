//operator overloading calculating age
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
  date operator-(date b)
   {
   date a;
    if (day<b.day)
    {
       a.day=day+30-b.day;
       m--;
    }
    else
       a.day=day-b.day;

   if (m<b.m)
     {
      a.m=m+12-b.m;
      yr=yr-1;
      }
   else
      a.m=m-b.m;

   a.yr=yr-b.yr;

   return(a);
   }

  void display()
   {
   cout<<"age is "<< yr<<" years "<<m<<" months and "<<day<<" days";
   }
};

void main()
{
int y1,m1,d1,y2,m2,d2;
clrscr();
cout<<"current year ";
cin>>y1;
cout<<"\n";
cout<<"current month ";
cin>>m1;
cout<<"\n";
cout<<"current day ";
cin>>d1;
cout<<"\n";
cout<<"birth year ";
cin>>y2;
cout<<"\n";
cout<<"birth month ";
cin>>m2;
cout<<"\n";
cout<<"birth day ";
cin>>d2;
cout<<"\n";
date b(y2,m2,d2), c(y1,m1,d1), a;
a=c-b;
a.display();
getch();
}
