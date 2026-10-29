public class tutorialq {
    static int[] getsumandsub(int a,int b){
        int[] answer = new int[2];
        answer[0]= a+b;
        answer[1]= a-b;
        return answer;
    }
    public static void main(String args[]){
        int [] answer = getsumandsub(100,50);
        System.out.println("Sum = " + answer[0]);
        System.out.println("Sub = " + answer[1]);
    }
}
