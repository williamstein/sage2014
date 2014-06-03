/**
 * An exception class to be thrown when a course conflict occurs. This class
 * is a runtime exception that indicates that the user has attempted to add a
 * class that conflicts with one that is already in the user's schedule.
 * 
 * @author Brian Chan
 */

public class ScheduleConflictException extends RuntimeException {
	private static final long serialVersionUID = 1L;

	/**
	 * Initializes a new ScheduleConflictException
	 */
	public ScheduleConflictException() {
		super();
	}
	
	/**
	 * Takes two courses that conflict and throws an error message.
	 * Assumes that c1 and c2 are not null.
	 * @param c1 A Course object
	 * @param c2 A Course object
	 */
	public ScheduleConflictException(Course c1, Course c2) {
		super(c1.getName() + " conflicts with " + c2.getName() + ".");
	}
}
