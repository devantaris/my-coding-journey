//sum of 2 and three numbers
#include<iostream.h>
#include<conio.h>
class A
{
 private:
  int a,b,c;
 public:
 A(int x,int y)
  {
   a=x;
   b=y;
   c=0;
  }
 A(int x,int y,int z)
  {
  a=x;
  b=y;
  c=z;
  }
 int add()
  {
  return(a+b+c);
  }
 };
void main()
{
A s1(2,3);
A s2(2,3,4);
cout<<s1.add();
cout<<"\n"<<s2.add();
getch();
}