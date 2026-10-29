//multiple inheritance from area of sq and rect to volume of cuboid
#include<iostream.h>
#include<conio.h>

class sq
{
  protected:
    int a;
  public:
  sq()
  {}
    sq(int x)
    {
    a=x;
    }
    int area1()
    {
     return(a*a);
    }
};
class rect
{
  protected:
    int b,c;
  public:
    rect()
    {}
    rect(int y,int z)
    {
    b=y;
    c=z;
    }
    int area2()
    {
     return(b*c);
    }
};
class cuboid: public sq, public rect
{
  public:
  cuboid()
  {}
    cuboid(int x,int y,int z)
      {
      a=x;
      b=y;
      c=z;
      }
    int vol()
      {
      return(a*b*c);
      }
};

void main()
{
cuboid cc(2,3,4);
clrscr();
cout<<"area of square is "<<cc.area1()<<"\n";
cout<<"area of rectangle is "<<cc.area2()<<"\n";
cout<<"volume of cuboid is "<<cc.vol();
getch();
}