import javax.swing.*;
import java.awt.event.*;

public class ButtonFrame extends JFrame implements ActionListener {
    JLabel label;
    
    public ButtonFrame() {
        setTitle("Button Frame");
        setSize(300, 200);
        setLayout(new java.awt.FlowLayout());
        
        JButton yesButton = new JButton("Yes");
        JButton noButton = new JButton("No");
        JButton closeButton = new JButton("Close");
        
        label = new JLabel("Press a button");
        
        yesButton.addActionListener(this);
        noButton.addActionListener(this);
        closeButton.addActionListener(this);
        
        add(yesButton);
        add(noButton);
        add(closeButton);
        add(label);
        
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    }
    
    public void actionPerformed(ActionEvent e) {
        String cmd = e.getActionCommand();
        if (cmd.equals("Close")) {
            dispose();
        } else {
            label.setText("Button " + cmd + " is pressed");
        }
    }
    
    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            new ButtonFrame().setVisible(true);
        });
    }
}