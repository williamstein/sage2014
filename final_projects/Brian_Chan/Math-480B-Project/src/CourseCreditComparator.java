/**
 * Sorts a schedule by the number of credits for each course using 
 * the Comparator Interface.
 * 
 * @author Brian Chan
 */

import java.util.*;

public class CourseCreditComparator implements Comparator<Course> {

	/**
	 * Initializes a new CourseCreditComparator
	 */
	public CourseCreditComparator() {
		
	}
	
	/**
	 * Returns an integer indicating this course's placement compared to 
	 * the other one. Compares first by number of credits in ascending order
	 * and breaks ties by comparing the course names in alphabetical order
	 * @param c1 A Course object
	 * @param c2 A Course object
	 * @return An integer
	 */
	public int compare(Course c1, Course c2) {
		if (c1.getCredits() != c2.getCredits()) {
			return c1.getCredits() - c2.getCredits();
		} 
		
		return c1.getName().compareTo(c2.getName());
	}
}
