//This and Super
class A 
{
    int x;
    public A (int a)
    {
        x=a;
    }
}
class B extends A 
{
    int x,y;
    public B(int a,int b)
    {
        super(a);
        y=b;
        int x=1;
        int z=30;
    }
    public void add()
    {
        int sum;
        int z=1;
        sum=x+y+z+this.z+super.x;
        System.out.println(""+sum);
    }
}

class thisandsuperkey
{
    public static void main(String[] args)
    {
        B bb= new B(20,10);
        bb.add();

    }
}