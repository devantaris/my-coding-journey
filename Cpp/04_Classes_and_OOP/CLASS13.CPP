//sum of 2 and three numbers
#include<iostream.h>
#include<conio.h>
class A
{
 private:
  int a,b,c,d;
 public:
 A(int x,int y)
  {
   a=x;
   b=y;
   c=0;
   d=0;
  }
 A(int x,int y,int z)
  {
  a=x;
  b=y;
  c=z;
  d=0;
  }
 A(int p,int q,int r,int s)
  {
  a=p;
  b=q;
  c=r;
  d=s;
  }
 int add()
  {
  return(a+b+c+d);
  }
 };
void main()
{
A s1(2,3);
A s2(2,3,4);
A s3(2,3,4,5);
clrscr();
cout<<s1.add();
cout<<"\n"<<s2.add();
cout<<"\n"<<s3.add();
getch();
}