import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Container;
import java.awt.FlowLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.PrintStream;
import java.util.Comparator;
import java.util.Set;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTable;
import javax.swing.ListSelectionModel;
import javax.swing.SwingConstants;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import javax.swing.table.JTableHeader;
import javax.swing.table.TableColumn;
import javax.swing.table.TableColumnModel;

/**
 * This class represents the graphical user interface (GUI) for the scheduling
 * program, allowing the user to view, add, and remove courses from a schedule.
 * 
 */
public class SchedulerGui {
	// the file name from which to read the student's courses
	private static final String COURSES_FILE_NAME = "courses.txt";
	
	// if true, grays out Drop button unless a course is selected in the table;
	// disabling by default because it relies on lots of student's code working
	private static final boolean SELECTION_ENABLING = false;
	
	private JFrame frame;
	private JTable scheduleTable;
	private JButton add;
	private JButton drop;
	private JButton save;
	private JLabel credits;
	private Schedule schedule;
	private ScheduleTableModel model;
	
	/**
	 * Constructs a new GUI to display items from the given catalog.
	 * @param catalog The store catalog to use
	 * @pre catalog != null
	 */
	public SchedulerGui() {
		load();
		createComponents();
		setupEvents();
		performLayout();
		frame.setVisible(true);
	}
	
	// Constructs all of the graphical components to reside in the window frame
	private void createComponents() {
		model = new ScheduleTableModel(schedule);
		scheduleTable = new JTable(model);
		
		// set up the table column headings
		JTableHeader header = scheduleTable.getTableHeader();
		header.setBackground(Color.YELLOW.brighter());
		header.setReorderingAllowed(false);
		TableColumnModel columnModel = scheduleTable.getColumnModel();
		for (int c = 0; c < model.getColumnCount(); c++) {
			TableColumn column = columnModel.getColumn(c);
			Weekday day = ScheduleTableModel.toDay(c);
			column.setHeaderValue(day == null ? "" : String.valueOf(day));
		}
		ListSelectionModel selectionModel = scheduleTable.getSelectionModel();
		selectionModel.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		
		// set up the various buttons
		add = new JButton("Add");
		add.setMnemonic('A');
		drop = new JButton("Drop");
		drop.setMnemonic('D');
		save = new JButton("Save");
		save.setMnemonic('S');
		if (SELECTION_ENABLING) {
			drop.setEnabled(false);
		}
		
		credits = new JLabel("");
		credits.setHorizontalAlignment(SwingConstants.CENTER);
		updateCredits();
		
		// window frame for the overall display
		frame = new JFrame("Course Scheduler");
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}
	
	// Sets up event handlers on all relevant components in the window.
	private void setupEvents() {
		// when the user checks/unchecks the Discount box, inform the shopping cart
		ActionListener listener = new ScheduleButtonListener();
		add.addActionListener(listener);
		drop.addActionListener(listener);
		save.addActionListener(listener);
		ListSelectionListener selection = new ScheduleSelectionListener();
		if (SELECTION_ENABLING) {
			scheduleTable.getSelectionModel().addListSelectionListener(selection);
		}
	}
	
	private class ScheduleSelectionListener implements ListSelectionListener {
		@Override
		public void valueChanged(ListSelectionEvent event) {
			int row = scheduleTable.getSelectedRow();
			int column = scheduleTable.getSelectedColumn();
			if (row < 0 || column < 0) {
				return;
			}
			boolean hasCourse = model.getValueAt(row, column) != null;
			drop.setEnabled(hasCourse);
		}
	}
	
	// Constructs containers to do the layout and positioning of the components
	// in the window.  Also creates the display components for the catalog items.
	private void performLayout() {		
		// south panel stores the ORDER TOTAL label and discount checkbox
		JPanel south = new JPanel(new GridLayout(0, 1));
		south.add(credits);
		JPanel southBottom = new JPanel(new FlowLayout());
		southBottom.add(add);
		southBottom.add(drop);
		southBottom.add(save);
		south.add(southBottom);
		
		// frame's content pane stores overall layout for the window
		Container contentPane = frame.getContentPane();
		contentPane.add(scheduleTable.getTableHeader(), BorderLayout.NORTH);
		contentPane.add(scheduleTable, BorderLayout.CENTER);
		contentPane.add(south, BorderLayout.SOUTH);
		frame.pack();
		SchedulerInputPane.center(frame);
	}
	
	// Handles the adding of a course to the schedule.
	private void add() {
		// pop up an input dialog box to read the course info
		String[] inputNames = {"name", "credits", "days (e.g. MWF)", "start time (e.g. 12:30 PM)", "duration (min)"};
		Class<?>[] inputTypes = {String.class, Integer.TYPE, String.class, String.class, Integer.TYPE};
		SchedulerInputPane pane = new SchedulerInputPane();
		boolean ok = pane.showInputDialog(frame, "Add a course",
				"Tell us more about the course you want to add:",
				inputNames, inputTypes);
		if (!ok) {
			return;
		}
		
		// use the course info from the dialog box to create the course
		try {
			// read info from dialog
			String name = pane.getString("name");
			int credits = pane.getInt("credits");
			String daysStr = pane.getString("days (e.g. MWF)");
			Set<Weekday> days = ScheduleIO.weekdaysFromShortNames(daysStr);
			String startTimeStr = pane.getString("start time (e.g. 12:30 PM)");
			Time startTime = Time.fromString(startTimeStr);
			int duration = pane.getInt("duration (min)");

			// create course and add to schedule
			Course course = new Course(name, credits, days, startTime, duration);
			model.addCourse(course);
			updateCredits();
		} catch (ScheduleConflictException e) {
			error(e, "Schedule conflict while trying to add your course.");
		} catch (IllegalArgumentException e) {
			error(e, "Illegal argument in new course information.\n"
					+ "Perhaps you left a field blank or typed an improper value.\n\n"
					+ "(see the console for more details about this error.)");
		} catch (Exception e) {
			error(e, "Error while reading new course information.\n"
					+ "Perhaps you left a field blank or typed an improper value.\n\n"
					+ "(see the console for more details about this error.)");
		}
	}
	
	// Handles the removal of a course from the schedule.
	private void drop() {
		int row = scheduleTable.getSelectedRow();
		int column = scheduleTable.getSelectedColumn();
		if (row < 0 || column < 0) {
			return;
		}
		
		model.removeCourse(row, column);
		updateCredits();
	}
	
	// A helper to pop up an error message box when the given exception is thrown.
	// The given error message is displayed to the user along with the exception.
	// The exception's stack trace is also printed to stderr.
	private void error(Exception exception, String message) {
		JOptionPane.showMessageDialog(frame, message + "\n\n" + exception.toString(),
				"Error", JOptionPane.ERROR_MESSAGE);
		exception.printStackTrace();
	}
	
	// A helper to pop up an error message box to show the given error message.
	private void error(String message) {
		JOptionPane.showMessageDialog(frame, message,
				"Error", JOptionPane.ERROR_MESSAGE);
	}
	
	// Loads the user's courses from COURSES_FILE_NAME and puts the
	// results into the user's current schedule.
	private void load() {
		try {
			schedule = ScheduleIO.load(new FileInputStream(COURSES_FILE_NAME));
			updateCredits();
		} catch (Exception e) {
			// also try loading from within a JAR
			InputStream stream = SchedulerGui.class.getResourceAsStream("/" + COURSES_FILE_NAME);
			if (stream != null) {
				try {
					schedule = ScheduleIO.load(stream);
				} catch (Exception e2) {
					System.err.println(e2);
				}
			}
			
			if (schedule == null) {
				error("An error occurred while loading your course schedule: \n" + e
						+ "\n\n(NOTE: Place any input .txt files in the following directory:)\n" + System.getProperty("user.dir"));
				schedule = new Schedule();
			}
		}
	}
	
	// Saves the user's current course schedule into COURSES_FILE_NAME.
	private void save() {
		String[] orders = {"By name", "By credits", "By day/time"};
		int result = JOptionPane.showOptionDialog(frame,
				"In what order should the courses be stored?",
				"Save order?",
				JOptionPane.OK_CANCEL_OPTION,
				JOptionPane.QUESTION_MESSAGE,
				null,
				orders,
				"By name");
		if (result < 0) {
			return;
		}
		
		// use the button clicked to decide which Comparator to create/use
		Comparator<Course> compare;
		if (result == 0) {
			compare = new CourseNameComparator();
		} else if (result == 1) {
			compare = new CourseCreditComparator();
		} else {
			compare = new CourseTimeComparator();
		}
		
		// actually save it now!
		try {
			schedule.save(new PrintStream(new File(COURSES_FILE_NAME)), compare);
			JOptionPane.showMessageDialog(frame, "Your course schedule was saved "
					+ "successfully to " + COURSES_FILE_NAME + ".");
		} catch (Exception ioe) {
			JOptionPane.showMessageDialog(frame,
					"An error occurred while saving your course schedule: \n" + ioe,
					"Input/output error", JOptionPane.ERROR_MESSAGE);
		}
	}
	
	// Updates the label displaying the student's current total credits.
	private void updateCredits() {
		credits.setText("Total credits: " + schedule.totalCredits());
	}
	
	// An action listener to respond to clicks on the buttons in the window.
	private class ScheduleButtonListener implements ActionListener {
		/**
		 * Called when a button is clicked in the window.
		 * Delegates to methods of the SchedulerGui for saving, adding, etc.
		 * @event details about which button was clicked
		 */
		public void actionPerformed(ActionEvent event) {
			Object src = event.getSource();
			if (src == drop) {
				drop();
			} else if (src == add) {
				add();
			} else if (src == save) {
				save();
			}
		}
	}
}
