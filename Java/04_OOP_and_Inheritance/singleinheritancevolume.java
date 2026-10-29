class A
{
	int a;
	A (int x)
	{
	a=x;
	}
	int cube()
	{
	return(a*a*a);
	}
}
class B extends A
{
	int b,c;
	B (int x,int y,int z)
	{
	super(x);
	b=y;
	c=z;
	}
	int cuboid()
	{
		return(a*b*c);
	}
}
class singleinheritancevolume
{
	public static void main(String as[])
	{
	B bb=new B(2,3,4);
	int l=bb.cube(); 
	int m=bb.cuboid();
	System.out.println("Volume of cube: "+l);
	System.out.println("Volume of cuboid: "+m);
	}
}