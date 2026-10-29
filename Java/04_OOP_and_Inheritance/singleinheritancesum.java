class A
{
int a,b;
A (int x,int y)
{
a=x;
b=y;
}
int add2()
{
return(a+b);
}
}
class B extends A
{
int c;
B (int x,int y,int z)
{
super(x,y);
c=z;
}
int add3()
{
return(a+b+c);
}
}
class singleinheritancesum
{
public static void main(String as[])
{
B bb=new B(2,3,4);
int l=bb.add2(); 
int m=bb.add3();
System.out.println("Sum of two numbers: "+l);
System.out.println("Sum of three numbers: "+m);
}
}