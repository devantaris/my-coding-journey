//returning object
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
  friend time add(time x, time y)
   {
   time z;
   z.h=x.h+y.h;
   z.m=x.m+y.m;
   return(z);
   }
  void display()
   {
   cout<<h<<":"<<m<<"\n";
   }
};

void main()
{
time t1(2,30), t2(3,20), t3,t4;
clrscr();
t3=add(t1,t2);
t1.display();
t2.display();
for(int i=0;i<7;i++)
  {
  cout<<"-";
  }
  cout<<"\n";
t3.display();
getch();
}
