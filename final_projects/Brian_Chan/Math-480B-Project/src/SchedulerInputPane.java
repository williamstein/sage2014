import java.awt.BorderLayout;
import java.awt.Container;
import java.awt.Dimension;
import java.awt.Frame;
import java.awt.GridLayout;
import java.awt.Toolkit;
import java.awt.Window;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.util.Map;
import java.util.TreeMap;
import javax.swing.BorderFactory;
import javax.swing.Box;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JComponent;
import javax.swing.JDialog;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextField;

/**
 * A general input window that can pop up and ask for several values.
 * 
 */
public class SchedulerInputPane {
	// Positions the given window in the center of the screen.
	public static void center(Window window) {
		Dimension screen = Toolkit.getDefaultToolkit().getScreenSize();
		window.setLocation((screen.width - window.getWidth()) / 2,
				(screen.height - window.getHeight()) / 2);
	}
	
	// a mapping from all names of input fields to their values
	private Map<String, Object> values = new TreeMap<String, Object>();

	/**
	 * Grabs an input from the window as a boolean value and returns it.
	 * @param name the name of the boolean value to fetch.
	 */
	public boolean getBoolean(String name) {
		Boolean b = (Boolean) values.get(name);
		return b.booleanValue();
	}

	/**
	 * Grabs an input from the window as an integer value and returns it.
	 * @param name the name of the integer value to fetch.
	 */
	public int getInt(String name) {
		Integer i = (Integer) values.get(name);
		return i.intValue();
	}

	/**
	 * Grabs an input from the window as a string value and returns it.
	 * @param name the name of the string value to fetch.
	 */
	public String getString(String name) {
		String s = (String) values.get(name);
		return s;
	}

	/**
	 * Displays an input dialog box, centered with respect to the given
	 * parent window frame (unless the parent is null), with the given
	 * window title text and message displayed, along with a set of labeled
	 * text boxes for reading input of the given types.
	 * @param parent the parent window about which to center (centered with
	 *               respect to the entire screen if parent is null)
	 * @param title text to show in window's title bar
	 * @param message message to display in the window above its inputs
	 * @param names names of each input to display
	 * @param types type of each input (strings, boolean checkboxes, etc.)
	 * @return true if the User clicks OK, false if the user cancels.
	 */
	public boolean showInputDialog(Frame parent, String title,
			String message, String[] names, Class<?>[] types) {
		return showInputDialog(parent, title, message, names, types, null);
	}

	/**
	 * Displays an input dialog box, centered with respect to the given
	 * parent window frame (unless the parent is null), with the given
	 * window title text and message displayed, along with a set of labeled
	 * text boxes for reading input of the given types.
	 * @param parent the parent window about which to center (centered with
	 *               respect to the entire screen if parent is null)
	 * @param title text to show in window's title bar
	 * @param message message to display in the window above its inputs
	 * @param names names of each input to display
	 * @param types type of each input (strings, boolean checkboxes, etc.)
	 * @param initialValues the initial value to put into each input field
	 * @return true if the User clicks OK, false if the user cancels.
	 */
	public boolean showInputDialog(Frame parent, String title,
			String message, final String[] names, final Class<?>[] types,
			final Object[] initialValues) {
		// hack to get a reference to a mutable boolean value
		final boolean[] result = { true };

		final JDialog dialog = new JDialog(parent, title, true);
		final JPanel west = new JPanel(new GridLayout(0, 1));
		// final Container center = new JScrollPane(new JPanel(new GridLayout(0, 1)));
		final Container center = Box.createVerticalBox();  // new JPanel(new GridLayout(0, 1));
		final JComponent[] comps = new JComponent[names.length];
		
		// add all of the checkboxes for each value in the dialog box
		for (int i = 0; i < names.length; i++) {
			west.add(new JLabel(names[i]));
			if (types[i] == Boolean.TYPE) {
				JCheckBox box = new JCheckBox();
				box.setSelected(initialValues != null
						&& initialValues[i].toString().equals("true"));
				comps[i] = box;
				center.add(box);
			} else if (types[i] != null) {
				int width = 10;
				if (types[i] == Integer.TYPE || types[i] == Double.TYPE) {
					width = 4;
				}
				final JTextField field = new JTextField(width);
				if (initialValues != null) {
					field.setText(initialValues[i].toString());
				}
				comps[i] = field;
				center.add(field);
			} else {
				// null type means blank slot
				center.add(new JPanel());
			}
		}

		// buttons at bottom of dialog box for OK and Cancel
		JPanel south = new JPanel();
		JButton ok = new JButton("OK");
		ok.setMnemonic('O');
		ok.requestFocus();
		ok.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				dialog.setVisible(false);
			}
		});
		south.add(ok);

		// make the dialog box close itself if the user presses Esc
		KeyListener key = new KeyAdapter() {
			public void keyPressed(KeyEvent e) {
				if (e.getKeyCode() == KeyEvent.VK_ESCAPE) {
					result[0] = false;
					dialog.setVisible(false);
				}
			}
		};

		// enable the fields to be reset to their initial values, if any
		if (initialValues != null) {
			JButton reset = new JButton("Reset");
			reset.setMnemonic('R');
			reset.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					for (int i = 0; i < names.length; i++) {
						if (types[i] == Boolean.TYPE) {
							JCheckBox box = (JCheckBox) comps[i];
							box.setSelected(initialValues != null
									&& initialValues[i].toString().equals("true"));
						} else if (types[i] != null) {
							JTextField field = (JTextField) comps[i];
							field.setText(initialValues[i].toString());
						}
					}
				}
			});
			south.add(reset);
			reset.addKeyListener(key);
		}

		JButton cancel = new JButton("Cancel");
		cancel.setMnemonic('C');
		cancel.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				result[0] = false;
				dialog.setVisible(false);
			}
		});
		south.add(cancel);
		cancel.addKeyListener(key);

		// set up the overall dialog box and show it
		dialog.setDefaultCloseOperation(JDialog.DO_NOTHING_ON_CLOSE);
		dialog.addWindowListener(new WindowAdapter() {
			public void windowClosing(WindowEvent e) {
				result[0] = false;
				dialog.setVisible(false);
			}
		});
		dialog.addKeyListener(key);
		ok.addKeyListener(key);
		dialog.getContentPane().setLayout(new BorderLayout(10, 5));
		((JComponent) dialog.getContentPane()).setBorder(BorderFactory
				.createEmptyBorder(10, 10, 10, 10));

		if (message != null) {
			JLabel messageLabel = new JLabel(message);
			dialog.add(messageLabel, BorderLayout.NORTH);
		}
		
		// perform layout
		Container westCenter = new JPanel(new BorderLayout());
		westCenter.add(west, BorderLayout.WEST);
		westCenter.add(center);
		
		dialog.add(new JScrollPane(westCenter));
		dialog.add(south, BorderLayout.SOUTH);
		dialog.pack();
		dialog.setResizable(false);
		center(dialog);

		// actually show the dialog box on the screen
		ok.requestFocus();
		dialog.setVisible(true);   // blocks until dialog box closes
		ok.requestFocus();

		// by this point, the dialog has been closed by the user
		values.clear();

		// store all the user's settings in the map for later
		for (int i = 0; i < names.length; i++) {
			if (types[i] == Boolean.TYPE) {
				JCheckBox box = (JCheckBox) comps[i];
				values.put(names[i], new Boolean(box.isSelected()));
			} else if (types[i] == Integer.TYPE) {
				JTextField field = (JTextField) comps[i];
				String text = field.getText();
				int value = 0;
				if (initialValues != null) {
					Integer integer = (Integer) initialValues[i];
					value = integer.intValue();
				}

				try {
					value = Integer.parseInt(text);
				} catch (Exception e) {
				}

				values.put(names[i], new Integer(value));
			} else if (types[i] != null) {
				JTextField field = (JTextField) comps[i];
				values.put(names[i], field.getText());
			}
		}
		
		// return my mutable boolean value from earlier;
		// true if the user clicked OK, false if they hit Esc or Cancel
		return result[0];
	}
}
