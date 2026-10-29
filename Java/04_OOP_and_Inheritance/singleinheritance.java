class A
{
void disa()
{
System.out.println("xyz");
}
}
class B extends A
{
void disb()
{
System.out.println("sbc");
}
}
class singleinheritance
{
public static void main(String as[])
{
B bb=new B();
bb.disa();
bb.disb();
}
}