class sum
{
int a,b,c;
void getvalue(int x,int y)
	{
	a=x;
	b=y;
	}
void add()
	{
	c=a+b;
	}
void display()
	{
	System.out.println("total= " + c);
	}
}
class summing
{
public static void main(String arg[])
{
sum s=new sum();
s.getvalue(2,3);
s.add();
s.display();
}
}