//multilevel inheritance   sum of 2,3,4,5 numbers
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
  B(int x,int y,int z):A(a,b)
  {
   a=x;
   b=y;
   c=z;
  }
 int add3()
  {
  return (a+b+c);
  }
};
class C:public B
{
  protected:
   int d;
  public:
   C(int x, int y,int z, int u):B(a,b,c)
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
class D:public C
{
  protected:
   int e;
  public:
    D(int p,int q, int r,int s, int t): C(a,b,c,d)
     {
      a=p;
      b=q;
      c=r;
      d=s;
      e=t;
     }
    int add5()
     {
     return(a+b+c+d+e);
     }
};

void main()
{
D dd(2,3,4,5,6);
clrscr();
cout<<dd.add2()<<"\n";
cout<<dd.add3()<<"\n";
cout<<dd.add4()<<"\n";
cout<<dd.add5();
getch();
}
