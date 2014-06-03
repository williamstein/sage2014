/** 
 * The Schedule object stores information about the collection of  
 * courses in which a student is enrolled in.
 * The user is able to add and remove courses as well save their schedule.
 * 
 *  @author Brian Chan 
 */

import java.util.*;
import java.io.*;

public class Schedule implements Cloneable {
	private List<Course> schedule;
	private int totalCredits;

	/** 
	 * Initializes a new Schedule object
	 */
	public Schedule() {
		this.schedule = new ArrayList<Course>();
		this.totalCredits = 0;
	}
	
	/**
	 * Adds the given course to the schedule
	 * @param c A course to add
	 */
	public void add(Course c) {
		// check if the given course conflicts with a course already 
		// in the schedule
		for (Course c2 : this.schedule) {
			if (c2.conflictsWith(c)) {
				throw new ScheduleConflictException(c, c2);
			}
		}
		this.schedule.add(c);
		this.totalCredits += c.getCredits();
	}
	
	/**
	 * Returns a copy of the object
	 */
	public Schedule clone() {
		// need to use try/catch to call Object's clone method
		
		try {
			Schedule copy = (Schedule) super.clone();
			
			// need to deep copy the list of courses
			copy.schedule = new ArrayList<Course>(schedule);
			
			return copy;
		} catch (CloneNotSupportedException e) {
			// never happens because I implemented Cloneable
			return null;
		}
	}
	
	/**
	 * Given a day and a time, returns the course (if any) that takes
	 * place during that day and time.
	 * @param day A given day in the week
	 * @param time A given time that the course is in session
	 * @return A course object
	 */
	public Course getCourse(Weekday day, Time time) {		
		for (Course c : this.schedule) {
			if (c.contains(day, time)) {
				return c;
			}
		}
		
		return null;
	}
	
	/**
	 * Removes a course (if any) from the schedule that takes place 
	 * on the given day and given time.
	 * @param day A given day in the week
	 * @param time A given time that the course is in session
	 */
	public void remove(Weekday day, Time time) {
		for (int i = 0; i < this.schedule.size(); i++) {
			Course c = this.schedule.get(i);
		
			if (c.contains(day, time)) {
				int credits = c.getCredits();
				this.totalCredits -= credits;
				this.schedule.remove(c);
				break;	// course found, don't need to traverse anymore
			}
		}
	}
	
	/**
	 * Outputs the courses from this schedule to the given output file in 
	 * the ordering represented by the given course comparator.
	 * @param ps The PrintStream object for output
	 * @param compare The comparator to use for course ordering: either a CourseNameComparator, CourseCreditComparator, or a CourseTimeComparator.
	 */
	public void save(PrintStream ps, Comparator<Course> compare) {
		// sort the schedule according to the comparator the user chose
		Collections.sort(this.schedule, compare);
		
		// for each course in the schedule, output it to the file
		for (Course course : this.schedule) {
			ps.println(course);
		}
		
		ps.close();
	}
	
	/**
	 * Returns the total number of credits for which the student is 
	 * enrolled in.
	 * @return The number of credits the schedule has
	 */
	public int totalCredits() {
		return this.totalCredits;
	}
	
	/**
	 * Returns a String representation of the schedule
	 */
	public String toString() {
		return this.schedule.toString();
	}
}
