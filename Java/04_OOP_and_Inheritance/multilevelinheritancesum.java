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
class C extends B
{
int d;
C (int x,int y,int z,int p)
{
super(x,y,z);
d=p;
}
int add4()
{
return(a+b+c+d);
}
}
class multilevelinheritancesum
{
public static void main(String as[])
{
C cc=new C(2,3,4,5);
int l=cc.add2(); 
int m=cc.add3();
int n=cc.add4();
System.out.println("Sum of two numbers: "+l);
System.out.println("Sum of three numbers: "+m);
System.out.println("Sum of four numbers: "+n);
}
}