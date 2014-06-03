import java.io.InputStream;
import java.util.EnumSet;
import java.util.InputMismatchException;
import java.util.Scanner;
import java.util.Set;

/**
 * This class contains static methods to handle the saving and loading of schedules
 * from files.
 * It might be better to place such functionality in the Schedule class itself,
 * but that is outside the scope of what we want students to work on for this
 * assignment, so it is migrated to a separate utility class.
 *
 */
public class ScheduleIO {
	public static Schedule load(InputStream in) {
		Scanner input = new Scanner(in);
		Schedule schedule = new Schedule();
		int lineNumber = 0;
		while (input.hasNextLine()) {
			String line = input.nextLine();
			lineNumber++;
			Scanner tokens = new Scanner(line);
			tokens.useDelimiter(", ");
			if (!tokens.hasNext()) {
				continue;
			}
			
			String name = tokens.next();
			int credits = tokens.nextInt();
			
			String daysStr = tokens.next();
			Set<Weekday> days = weekdaysFromShortNames(daysStr);
			
			String timeStr = tokens.next();
			Time startTime = Time.fromString(timeStr);
			
			int duration = tokens.nextInt();
			
			Course course = new Course(name, credits, days, startTime, duration);
			schedule.add(course);
		}
		return schedule;
	}

	/**
	 * Converts a string of short day names into a set of Weekday values.
	 * For example, turns "MWF" into the set [MONDAY, WEDNESDAY, FRIDAY].
	 * @param shortNames string of condensed weekday names, such as "MWF".
	 */
	public static Set<Weekday> weekdaysFromShortNames(String shortNames) {
		try {
			Set<Weekday> days = EnumSet.noneOf(Weekday.class);
			for (int i = 0; i < shortNames.length(); i++) {
				Weekday day = Weekday.fromString(shortNames.substring(i, i+1));
				days.add(day);
			}
			return days;
		} catch (IllegalArgumentException e) {
			throw new InputMismatchException(shortNames);
		}
	}
}
