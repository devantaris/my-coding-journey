//multiple inheritance 2 base class have integers and add in derived class
#include<iostream.h>
#include<conio.h>

class A
{
  protected:
    int a;
  public:
    void display()
      {
      cout<<a<<"\n";
      }
};
class B
{
  protected:
    int b;
  public:
    void display()
      {
      cout<<b<<"\n";
      }
};
class C: public A, public B
{
  public:
    C (int x,int y)
      {
      a=x;
      b=y;
      }
    int add()
      {
      return(a+b);
      }
};

void main()
{
C cc(2,3);
clrscr();
cout<<cc.add();
getch();
}