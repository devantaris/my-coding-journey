class stars4
{
	public static void main(String args[]) 
	{
	for(int i=1;i<=3;i++)
		{
		for (int j=1;j<=i;j++)
			{
			if(j==1)
				{System.out.print("@");
				}
			else if(j==2)
				{System.out.print("#");
				}		
			else if(j==3)
				{System.out.print("$");
				}
			}
		System.out.println("");
		}
	}
}