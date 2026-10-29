public class learninterface implements face1 {

    double value;

    public learninterface() 
    {
        value = face1.pi * 2 * 3;
        getsum(value);
    }

    public void getsum(double a) {
        System.out.println(a);
    }

    public static void main(String[] args) {
        learninterface dd = new learninterface();
    }
}