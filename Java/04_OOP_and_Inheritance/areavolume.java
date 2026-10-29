class dimension
{
int l,b,h;
dimension (int x,int y, int z)
{
l=x;
b=y;
h=z;
}
dimension (int x,int y)
{
l=x;
b=y;
h=1;
}
dimension (int x)
{
l=x;
b=x;
h=1;
}
int volarea()
{
return(l*b*h);
}
}
class areavolume
{
public static void main(String args[])
{
dimension d1= new dimension(2,3,4);
dimension d2= new dimension(2,3);
dimension d3=new dimension(2);
System.out.println("volume of cuboid is = " + d1.volarea());
System.out.println("area of rectangle is = " + d2.volarea());
System.out.println("area of square is = " + d3.volarea());
}
}