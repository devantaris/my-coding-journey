class sum
{
int a,b,c;
sum (int x,int y, int z)
{
a=x;
b=y;
c=z;
}
sum (int x,int y)
{
a=x;
b=y;
c=0;
}
int add()
{
return(a+b+c);
}
}
class constover
{
public static void main(String args[])
{
sum s1= new sum(2,3);
sum s2= new sum(2,3,4);
System.out.println("" + s1.add());
System.out.println("" + s2.add());
}
}