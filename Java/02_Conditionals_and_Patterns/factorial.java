class factorial
{
public static void main(String args[]) 
{
int n,f=1;
n=Integer.parseInt(args[0]);
while (n>0)
{
f=f*n;
n--;
}
System.out.println(""+f);
}
}