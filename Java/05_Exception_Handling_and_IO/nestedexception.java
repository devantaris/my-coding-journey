public class nestedexception {
    int n1;
    int n2;
    int d;
    public nestedexception(String a, String b)
        {
            try{
                try{
                    n1=Integer.parseInt(a);
                    n2=Integer.parseInt(b);
                }
                catch (NumberFormatException ee) {
                    System.out.println("Enter bot integer values");
                }
                d=n1/n2;
                System.out.println("Answer is: "+d);
            }
            catch(ArithmeticException e){
                System.out.println("divide by zero not possible");
            }
            finally{
                System.out.println("Exception handled. \n Done");
            }
        }
    public static void main(String[] args) {
        nestedexception mm=new nestedexception(args[0],args[1]);
    }
    }
    