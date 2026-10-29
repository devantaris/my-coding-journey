class prime 
{
public static void main(String args[]) 
{
for (int n = 2; n <= 100; n++) 
{
int c = 0;
for (int i = 2; i <= n; i++)
{
if (n % i == 0) 
{
c=c+1;
}
}
if (c == 1) 
{
System.out.println(""+n);
}
}
}
}