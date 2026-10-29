public class multipleexception {
    int n1;
    int n2;
    int d;
    public multipleexception(String a, String b)
        {
            try{
                n1=Integer.parseInt(a); 
                n2=Integer.parseInt(b);
                d=n1/n2;
                System.out.println("Answer is: "+d);
            }
            catch(ArithmeticException e){
                System.out.println("divide by zero not possible");
            }
            catch (NumberFormatException ee) {
                System.out.println("Enter both integer values");
            }
            finally{
                System.out.println("Exception handled. \n Done");
            }
        }
    public static void main(String[] args) {
        multipleexception mm=new multipleexception(args[0],args[1]);
    }
    }
    