//multilevel inheritance
#include<iostream.h>
#include<conio.h>
class A
{
 protected:
  int a,b;
 public:
  A(int x,int y)
  {
  a=x;
  b=y;
  }
  int add2()
  {
  return(a+b);
  }
};
class B:public A
{
 protected:
  int c;
 public:
  B(int x,int y,int z)
  {
   a=x;
   b=y;
   c=z;
  }
 int add3()
  {
  return (a*b*c);
  }
};
class C:public B
{
  protected:
   int d;
  public:
   C(int x, int y,int z, int u)
   {
    a=x;
    b=y;
    c=z;
    d=u;
   }
  int add4()
  {
   return(a+b+c+d);
  }
};

void main()
{
C cc(2,3,4,5);
clrscr();
cout<<cc.add2();
cout<<cc.add3();
cout<<cc.add4();
getch();
}
