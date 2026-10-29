class fibonacci
{
public static void main(String args[]) 
{
int a=0,b=1,c,n,i;
n=Integer.parseInt(args[0]);
System.out.print(""+a+b);
for (i=0;i<n;i++)
{
c=a+b;
a=b;
b=c;
System.out.print(""+b);
}
}
}