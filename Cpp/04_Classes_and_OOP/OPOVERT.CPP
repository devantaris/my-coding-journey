//time polymorphism operator overloading
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
  time operator+(time x)
   {
   time z;
   z.h=x.h+h;
   z.m=x.m+m;
   return(z);
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
t3=t1+t2;
t1.display();
t2.display();
for(int i=0;i<5;i++)
  {
  cout<<"-";
  }
  cout<<"\n";
t3.display();
getch();
}
