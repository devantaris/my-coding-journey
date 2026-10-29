public class formatexception {
    int aa;
    public formatexception(String a)
        {
            try{
                aa=Integer.parseInt(a);
            }
            catch(NumberFormatException e){
                System.out.println("Enter and integer.");
            }
            finally{
                System.out.println("Exception handled. \n Done");
            }
        }
    public static void main(String[] args) {
        formatexception ff=new formatexception(args[0]);
    }
    }
    