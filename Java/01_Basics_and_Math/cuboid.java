class volume
{
int l,b,h;
void getvalue(int x,int y,int z)
	{
	l=x;
	b=y;
	h=z;
	}
int calc()
	{
	int v=(l*b*h);
	return(v);
	}
void display()
	{
	int vv=calc();
	System.out.println("Volume of cuboid= " + vv);
	}
}
class cuboid
{
public static void main(String arg[])
{
volume s=new volume();
s.getvalue(2,3,4);
s.display();
}
}