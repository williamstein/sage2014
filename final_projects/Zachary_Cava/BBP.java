import java.util.*;
import java.util.concurrent.*;
import static java.util.Arrays.asList;

/**
 * Java Bailey-Borwein-Plouffe formula implementation.
 * Adapted from a number of papers, the main one being:
 *    http://www.davidhbailey.com/dhbpapers/bbp-alg.pdf
 *
 * Main Features:
 *   - Full Implementation of Pi Spigot
 *   - Semi-Generalization to support other constants of BBP form
 *   - Parallelized computation
 *
 * 
 * @author Zachary Cava
 * @version Monday June 2nd, 2014
 */
public class BBP {
	/**
	 * The maximum difference needed in series iterations before
	 * the series is considered "converged"
	 */
	private static final double EPSILON = 1e-17;

	/**
	 * An array to cache the powers of two in
	 */
	private static long[] TWO_POWERS;

	/**
	 * The number of powers to cache for fast exponentiation
	 */
	private static final int POWER_CACHE = 63;

	/**
	 * Whether or not to run computations in parallel when possible
	 */
	private static final boolean PARALLEL = true;

	/**
	 * Number of threads to use when running in parallel
	 */
	private static final int THREADS = 4;

	/**
	 * Calculates the hexidecimal at the given position in the
	 * numerical constant pi
	 * 
	 * @param  position the position of the hexidecimal to compute
	 * @return the computed digit
	 */
	public static double pi(long position) {
		int[][] config = {
			{4, 1, 8},
			{-2, 4, 8},
			{-1, 5, 8},
			{-1, 6, 8}
		};

		double piPoint = bbp(config, position, 16);
		piPoint = piPoint - Math.floor(piPoint) + 1;

		return piPoint;
	}

	/**
	 * Calculates the hexidecimal at the given position in the
	 * numerical constant ln(10)
	 * 
	 * @param  position the position of the hexidecimal to compute
	 * @return          the computed digit
	 */
	public static double ln10(long position) {
		int[][] config = {
			{24, 1, 4},
			{20, 2, 4},
			{6, 3, 4},
			{1, 4, 4}
		};

		double lnPoint = bbp(config, position, 16) / 16;
		lnPoint = lnPoint - Math.floor(lnPoint) + 1;

		return lnPoint;
	}

	/**
	 * Given a configuration of series to compute, computes the appropriate
	 * sum are returns the raw result, additional processing may be
	 * necessary. The series are of the form of the bbpSeries method.
	 *
	 * The configuration should be arranged such that each array in the
	 * configuration represents one series term to be computed, the contents
	 * of the arrays should be:
	 * 		Index	Correlation
	 * 		  0		The value to multiply the series by
	 * 		  1     The numerator of the series
	 * 		  2     The multiplier of the denominator of the series
	 * 
	 * @param  configuration the sum configuration outlined above
	 * @param  position the position of the constant to compute
	 * @param  base the numerical base to use
	 * @return the summized value
	 */
	private static double bbp(int[][] configuration, long position, int base) {
		double runningSum = 0;

		// check if parallelism is enabled
		if(PARALLEL) {
			// cache before parallel computation to avoid race conditions
			// and unnecessary locking
			cachePowers();

			try {
				// compute in parallel since the series are independent
				BBPSeriesParallel[] seriesBuilders = new BBPSeriesParallel[configuration.length];
				for(int i = 0; i < configuration.length; i++) {
					int[] single = configuration[i];
					seriesBuilders[i] = new BBPSeriesParallel(single[0], single[1], single[2], base, position);
				}
				ExecutorService executor = Executors.newFixedThreadPool(THREADS);
				List<Future<Double>> results = executor.invokeAll(asList(seriesBuilders));
				executor.shutdown();

				for(Future<Double> result : results) {
					runningSum += result.get();
				}
			} catch(Exception err) {
				System.out.println("Exception in computation, results invalid");
			}
		} else {
			// compute linearly
			for(int i = 0; i < configuration.length; i++) {
				int[] single = configuration[i];
				runningSum += single[0] * bbpSeries(single[1], single[2], base, position);
			}
		}
		return runningSum;
	}



	/**
	 * Computes a series portion of a BBP formula for the given pieces
	 * For a summation with sum variable k:
	 *      sum from k to infinity (1/(b^k)) * (1 / (m*k + a))
	 * Where:
	 * 		b - the numerical base
	 * 		m - the multiplier to the kth variable
	 * 		a - the additive value to the divisor
	 * 		
	 * @param  additive the value to add to the bottom divisor
	 * @param  mult the value to multiply k by in the divisor
	 * @param  base the value to use as a numerical base
	 * @param  pos the digit position to compute
	 * @return the result of the series
	 */
	public static double bbpSeries(int additive, int mult, int base, long pos) {
		double sum = 0;
		long denom = 0;
		long pow = 0;
		double term = 0;
		for(int i = 0; i < pos; i++) {
			denom = mult * i + additive;
			pow = pos - i;
			term = modPow(pow, denom, base);
			sum = sum + term / denom;
			// cast to truncate
			// observe that the sum is always positive
			sum = sum - (int) sum;
		}

		double divExp = 1;
		denom = mult * pos + additive;
		term = divExp / denom;
		int i = 0;
		while(i < 100 && term >= EPSILON) {
			sum = sum + term;
			sum = sum - Math.floor(sum);
			i++;
			denom += mult;
			divExp /= base;
			term = divExp / denom;
		}
		return sum;
	}

	/**
	 * Computes the following formula using fast exponentiation
	 *     base ^ exp % mod
	 *     
	 * @param  exp  the exponent to compute
	 * @param  mod  the value to mod by
	 * @param  base the base value to exponentiate
	 * @return the result of the computation
	 */
	private static double modPow(long exp, long mod, int base) {
		// quick cut off
		if(mod == 1) {
			return 0;
		}

		// check if we need to cache values
		if(!PARALLEL && TWO_POWERS == null) {
			cachePowers();
		}

		int i = 0;
		while(i < TWO_POWERS.length && TWO_POWERS[i] <= exp) {
			i++;
		}

		long pow2 = TWO_POWERS[i];
		long pow1 = exp;
		double result = 1;

		for(int j = 0; j <= i; j++) {
			if(pow1 >= pow2) {
				result = base * result;
				result = result - (int)(result / mod) * mod;
				pow1 = pow1 - pow2;
			}
			pow2 = pow2 >> 1;
			if(pow2 >= 1) {
				result = result * result;
				result = result - (int)(result / mod) * mod;
			}
		}
		return result;
	}

	/**
	 * Caches the powers of two in the global array for fast
	 * exponentiation
	 */
	private static void cachePowers() {
		TWO_POWERS = new long[POWER_CACHE];
		TWO_POWERS[0] = 1;
		for(int i = 1; i < TWO_POWERS.length; i++) {
			TWO_POWERS[i] = TWO_POWERS[i - 1] << 1;
		}
	}

	/**
	 * Small internal callable task to help with parallelization
	 */
	private static class BBPSeriesParallel implements Callable<Double> {
		private final int additive;
		private final int multiplier;
		private final int base;
		private final long position;
		private final int scale;

		public BBPSeriesParallel(int scale, int add, int mult, int base, long pos) {
			this.scale = scale;
			additive = add;
			multiplier = mult;
			this.base = base;
			position = pos;
		}

		@Override
		public Double call() {
			return scale * bbpSeries(additive, multiplier, base, position);
		}
	}

	/**
	 * Runs the BBP algorithm with the first argument as the decimal position to compute
	 * @param args
	 */
	public static void main(String[] args) {
		if(args.length < 1 || Long.parseLong(args[0]) < 0) {
			System.err.println("No position given to calculate, any integer greater than 0 is allowed");
			System.exit(1);
		}

		long digitPosition = Long.parseLong(args[0]);

		double point = BBP.pi(digitPosition);

		String hex = Double.toHexString(point).toUpperCase();
		// String the unnecessary values from the double string
		System.out.println(hex.substring(4, hex.length() - 2));
	}
}