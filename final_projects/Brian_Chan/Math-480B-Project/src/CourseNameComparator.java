/**
 * Sorts a schedule by course name using the Comparator Interface.
 * 
 * @author Brian Chan
 */

/*
Brian Chan

Sorts a schedule by course name.
*/

import java.util.*;

public class CourseNameComparator implements Comparator<Course> {

	/**
	 * Initializes a new CourseNameComparator
	 */
	public CourseNameComparator() {
		
	}
	
	/**
	 * Returns an integer indicating this course's placement compared to
	 * the other one. Compares the names of the courses in alphabetical
	 * order
	 * @param c1 A Course object
	 * @param c2 A Course object
	 * @return An integers 
	 */
	public int compare(Course c1, Course c2) {
		return c1.getName().compareTo(c2.getName());
	}

}
