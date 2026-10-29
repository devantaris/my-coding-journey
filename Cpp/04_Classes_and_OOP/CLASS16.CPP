//single level inheritance sum of 2 and 3 numbers
#include<iostream.h>
#include<conio.h>
class sum2
{
public:
 int a,b;
 void getdata(int x,int y)
  {
  a=x;
  b=y;
  }
 int add2()
  {
  return (a+b);
  }
};
class sum3:public sum2
{
public:
 void getdata(int x,int y,int z)
  {
  a=x;
  b=y;
  c=z;
  }
  int add3()
  {
  return(a+b+c);
  }
};

void main()
{
sum2 ss;
clrscr();
ss.getdata(2,3,4);
int n=ss.add2();
int m=ss.add2();
cout<<n;
cout<<m;
getch();
}


void main ()
{
B bb;
clrscr();
bb.display();
bb.dis();
getch();
}











































































































































































































































































































































































