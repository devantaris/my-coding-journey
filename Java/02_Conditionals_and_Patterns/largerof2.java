class big
{
int a,b;
void getvalue(int x,int y)
	{
	a=x;
	b=y;
	}
int compare()
	{
	if(a>b){
	return(a);
	}
	else{
	return(b);
	}
	}
void display()
	{
	int c=compare();
	System.out.println("total= " + c);
	}
}
class largerof2
{
public static void main(String arg[])
{
big s=new big();
s.getvalue(2,3);
s.display();
}
}