class big3
{
public static void main(String arg[])
{
int a,b,c;
a=Integer.parseInt(arg[0]);
b=Integer.parseInt(arg[1]);
c=Integer.parseInt(arg[2]);
if (a>b)
{
	if (a>c)
		{
			System.out.println(""+a+" is biggest number");
		}
	else
		{
			System.out.println(""+c+" is biggest number");
		}
}
else
{
	if (b>c)
		{
			System.out.println(""+b+" is biggest number");
		}
	else
		{
			System.out.println(""+c+" is biggest number");
		}
}
}
}