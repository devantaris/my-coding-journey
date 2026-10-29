import javax.swing.JFrame;
import javax.swing.JButton;
import java.awt.BorderLayout;
import java.awt.FlowLayout;

class framedemo extends JFrame{
	public static void main(String args[]){
		framedemo frm = new framedemo();
		frm.setSize(600,400);	//setSize(int w, int h)
		frm.setVisible(true);	//setVisible(boolean)		
	}

	/*public framedemo(){
		BorderLayout bl=new BorderLayout();
		setLayout(bl);

		JButton btn1 = new JButton("Save");
		add(btn1, "North");	//add(Component)

		JButton btn2 = new JButton("Print");
		add(btn2);

		//JButton btn3 = new JButton("Close");
		//add(btn3, "West");
		

		FlowLayout fll = new FlowLayout();
		 setLayout(fll);
		JButton btn1,btn2,btn3;
		btn1 = new JButton("Save1");
		btn2 = new JButton("Save2");
		btn3 = new JButton("Save3");
		add(btn1);
		add(btn2);
		add(btn3);
		
	
	}*/
}