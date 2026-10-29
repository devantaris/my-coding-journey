public class Pomodoro {
    public static void main(String[] args) throws InterruptedException {
        int work = 25, rest = 5;
        while(true) {
            System.out.println("Work for " + work + " minutes");
            countdown(work * 60);
            System.out.println("\nBreak time!");
            countdown(rest * 60);
        }
    }
    
    private static void countdown(int seconds) throws InterruptedException {
        for(int i = seconds; i > 0; i--) {
            System.out.print("\r" + String.format("%02d:%02d", i/60, i%60));
            Thread.sleep(1000);
        }
    }
}