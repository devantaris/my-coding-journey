#include<iostream.h>
#include<conio.h>

class time
{
  int h,m;
 public:
  time()
   {}
  time(int x,int y)
   {
   h=x;
   m=y;
   }
  void add(time x, time y)
   {
   h=x.h+y.h;
   m=x.m+y.m;
   }
  void display()
   {
   cout<<h<<":"<<m<<"\n";
   }
};

void main()
{
time t1(2,30), t2(3,20), t3;
clrscr();
t3.add(t1,t2);
t1.display();
t2.display();
cout<<"--------------\n";
t3.display();
getch();
}
