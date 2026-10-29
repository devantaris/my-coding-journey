class leapyear
{
public static void main(String arg[])
{
int yr;
yr=Integer.parseInt(arg[0]);
if (yr%4==0 && yr%100!=0 || yr%400==0)
{
System.out.println("Year is leap year");
}
else
{
System.out.println("Year is not leap year");
}
}
}