class sum
{
int a,b,c;
void getvalue(int x,int y)
	{
	a=x;
	b=y;
	}
int add()
	{
	c=a+b;
	return(c);
	}
}
class summing2
{
public static void main(String arg[])
{
sum s=new sum();
s.getvalue(2,3);
int xx=s.add();
System.out.println(""+xx);
}
}