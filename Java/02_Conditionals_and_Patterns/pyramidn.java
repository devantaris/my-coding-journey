class pyramidn
{
	public static void main(String args[]) 
	{
int i,j,k,l;
for (i=0;i<=3;i++)
 {
 for (j=i;j<3;j++)
  {
  System.out.print(" ");
  }
 for (k=1;k<=i;k++)
   {
   System.out.print(""+k);
   }
 for(l=1;l<i;l++)
    {
    System.out.print(""+l);
    }
 System.out.print("\n");
 }
	}
}