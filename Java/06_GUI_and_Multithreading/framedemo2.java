import javax.swing.JFrame;
import javax.swing.JButton;
import java.awt.BorderLayout;
import java.awt.FlowLayout;
import java.awt.Container;
import java.awt.GridLayout;

class framedemo2 extends JFrame{
	public static void main(String args[]){
		framedemo2 frm = new framedemo2();
		frm.setSize(600,400);	//setSize(int w, int h)
		frm.setVisible(true);	//setVisible(boolean)		
	}

	public framedemo2(){

		Container cn = getContentPane();

		/*BorderLayout bl=new BorderLayout();
		cn.setLayout(bl);

		JButton btn11 = new JButton("Save");
		cn.add(btn11, "East");	//add(Component)

		JButton btn2 = new JButton("Print");
		cn.add(btn2);

		JButton btn3 = new JButton("Close");
		cn.add(btn3, "West");
		*/

		/*FlowLayout fll = new FlowLayout();
		cn.setLayout(fll);
		JButton btn1,btn2,btn3;
		btn1 = new JButton("Save1");
		btn2 = new JButton("Save2");
		btn3 = new JButton("Save3");
		cn.add(btn1);
		cn.add(btn2);
		cn.add(btn3);
		*/
	
		GridLayout fll = new GridLayout(2,4);
		cn.setLayout(fll);
		JButton btn1,btn2,btn3,btn4,btn5,btn6,btn7;
		btn1 = new JButton("Save11");
		btn2 = new JButton("Save21");
		btn3 = new JButton("Save31");
		btn4 = new JButton("Save41");
		btn5 = new JButton("Save51");
		btn6 = new JButton("Save61");
		btn7 = new JButton("Save61");
		cn.add(btn1);
		cn.add(btn2);
		cn.add(btn3);
		cn.add(btn4);
		cn.add(btn5);
		cn.add(btn6);
		cn.add(btn7);


	}
}