/**
 * Sorts a schedule by days and times using the Comparator Interface.
 * 
 * @author Brian Chan
 */

import java.util.*;

public class CourseTimeComparator implements Comparator<Course> {

	/**
	 * Initializes a new CourseTimeComparator
	 */
	public CourseTimeComparator() {
		
	}
	
	/**
	 * Returns an integer indicating this course's placement compared to
	 * the other one. Compares first by the start time in ascending chronological 
	 * order. Breaks ties by ending time (or duration) in ascending chronological
	 * order and finally breaks ties by name in alphabetical order
	 * @param c1 A Course object
	 * @param c2 A Course object
	 * @return An integer
	 */
	public int compare(Course c1, Course c2) {
		Time t1 = c1.getStartTime();
		Time t2 = c2.getStartTime();
		
		if (!t1.equals(t2)) {
			return t1.compareTo(t2);
		} else if (c1.getDuration() != c2.getDuration()) {
			return c1.getDuration() - c2.getDuration();
		}
		
		return c1.getName().compareTo(c2.getName());
	}
}
