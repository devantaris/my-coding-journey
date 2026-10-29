class avgof5
{
	public static void main(String arg[])
	{
	int a,b,c,d,e,avg;
	a=Integer.parseInt(arg[0]);
	b=Integer.parseInt(arg[1]);
	c=Integer.parseInt(arg[2]);
	d=Integer.parseInt(arg[3]);
	e=Integer.parseInt(arg[4]);
	avg=(a+b+c+d+e)/5;
	System.out.println("The average of the 5 numbers is: "+avg);
	}
}