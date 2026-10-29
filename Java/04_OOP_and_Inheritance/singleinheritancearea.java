class A
{
int a;
A (int x)
{
a=x;
}
int areasquare()
{
return(a*a);
}
}
class B extends A
{
int b;
B (int x,int y)
{
super(x);
b=y;
}
int arearectangle()
{
return(a*b);
}
}
class singleinheritancearea
{
public static void main(String as[])
{
B bb=new B(2,3);
int l=bb.areasquare(); 
int m=bb.arearectangle();
System.out.println("Area of Square: "+l);
System.out.println("Area of rectangle: "+m);
}
}