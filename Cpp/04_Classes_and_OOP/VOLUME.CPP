//volume of cube, cylinder and cuboid
#include<stdio.h>
#include<conio.h>
#include<iostream.h>
vol (int a)
{
return(a*a*a);
}
vol (int a,int b)
{
return ((22*a*a*b)/7);
}
vol (int a, int b, int c)
{
return (a*b*c);
}
   void main()
   {
   int cu,cub,cy,a,b,c;
   clrscr();
   cout<<"Enter 3 integers: ";
   cin>>a>>b>>c;
   cu=vol(a);
   cub=vol(a,b,c);
   cy=vol(a,b);
   cout<<"volume of cube is: "<<cu;
   cout<<"\nvolume of cylinder is: " <<cy;
   cout<<"\nvolume of cuboid is: "<<cub;
   getch();
   }
