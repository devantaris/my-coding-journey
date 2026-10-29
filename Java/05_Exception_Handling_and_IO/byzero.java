public class byzero {
    public static void main(String args[])
    {
        int n1=10;
        int n2=0;
        try 
        {
            int res=n1/n2;
            System.out.println(""+res);
        } 
        catch (ArithmeticException e) 
        {
            System.out.println("Cant divide by zero");
        }
        finally
        {
            System.out.println("Done");
        }
    }
}
