//copy constructor
#include<iostream.h>
#include<conio.h>
class sum
{
 private:
  int a,b;
 public:
 sum (int x,int y)
  {
  a=x;
  b=y;
  }
 sum()
 {}
 int add()
  {
  return(a+b);
  }
 };
void main()
{
sum s1(2,3);
sum s2=s1;
clrscr();
cout<<s1.add();
cout<<"\n"<<s2.add();
getch();
}