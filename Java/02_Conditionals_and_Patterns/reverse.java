class reverse
{
public static void main(String args[]) 
{
int n,r,s=0;
n=Integer.parseInt(args[0]);
while (n>0)
{
r=n%10;
s=s*10+r;
n=n/10;
}
System.out.println(""+s);
}
}