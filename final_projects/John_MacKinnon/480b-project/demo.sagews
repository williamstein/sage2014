︠978f9413-fa5d-4d85-b2b9-49c89bcf4d3fr︠

import mmh3
import collections

class Bloomfilter(object):
    """
    A bloom filter is a probabilistic data structure used for membership testing.  Objects added to a bloom filter are not actually stored in the filter; rather, each added object is hashed several times, and the corresponding bits are set in an underlying bit vector.  When an object is tested for membership, it is hashed by the same hash functions, and the resulting bits are checked in the bit vector.  If all corresponding bits are set, it is said that the element "may" have been added to the filter; if at least one of the bits is not set, however, it is definitely the case that the object is not a member of the filter.  Note that, in this way, a bloom filter may return false positives for membership testing, but will never produce false negatives.  That is, a bloom filter should be used when it is desirable to know with some degree of certainty that an object "might" be a member, and with absolute certainty that an object is not a member.

    Note that, due to the use of a bit vector to represent the underlying data, it is not possible to retrieve the members added to a filter (nor to iterate, remove, etc.).  If retrievability is desired, or if false positives are not tolerated, a user would be better suited using the builtin set type in python.  However, these concessions allow for extremely space efficient storage (linear - with a small constant - in the size of the bit vector), as well as fast lookup (linear in the number of hash functions used - regardless of the number of added members).  Bloomfilters are often effectively used as a pre-screening measure, with a traditional set containing all members stored on disk.
    
    Further, note that due to the bit vector representation, intersection, difference, and symmetric difference are all meaningless in the context of a bloom filter.  As such, insertion and union operations are the only possible set behaviors, in addition to membership testing.
    
    A sample use of a Bloomfilter is for file-tree caching.  For example, a massive amount of files may be stored in a data warehouse.  A user may want to query this warehouse to see if a given file is contained.  It would be impossible to store all of the filenames in memory, and thus, they must simply be stored on disk.  Rather than having to go to disk every single time a lookup is performed (which is several orders of magnitude slower than holding the names in memory), a Bloomfilter can be used as a "pre-filter".  That is, all of the filenames can be 'stored' in the filter efficiently, and we can test for membership of filenames with high accuracy.  If a filename is indicated as "maybe present" then we will have to access the file by reading it off disk anyway.  However, if a filename is indicated as "definitely not present", then we save all of the time of checking if the file is on disk, which is a huge speedup.
    
    
    This is a first implementation of a bloom filter in sage, and thus is not a mature data structure yet.  Future improvements include: the ability to pickle and unpickle a filter, and subclasses/variations that allow for counting in bloom filters (http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.91.6328), and scalabling bloom filters once the maximum false positive rate has been exceeded (http://gsd.di.uminho.pt/members/cbm/ps/dbloom.pdf).
    """
    
    def __init__(self, size, max_fp_rate, hash_count, iterable=None):
        """
        Initializes a new bloom filter.  If an iterable is provided, then the filter will be initialized with each of the iterable's elements as added members, otherwise the filter will be empty.  Note that it is possible that adding all of the elements of the iterable may cause the filter to already exceed its maximum allowed false-positive rate, depending on the other parameters; an error will be thrown in this case.
        
        The max_fp_rate parameter sets an upper limit for the allowed expected probability of false-positives for membership testing; upon exceeding this value, an error will be thrown by the add() function.  Thus, a larger max_fp_rate value will allow for the addition of more elements into a smaller filter, but comes at the cost of reliability of membership testing.  If a user wishes to use a bloom filter with arbitrarily poor membership-testing accuracy, a value of 1.0 can be given as the max_fp_rate (i.e. allowing for a 100% estimated probability of false-positives).
        
        The size parameter establishes the size of the underlying bit vector used by the bloom filter.  A larger vector will translate to a lower false-positive rate, but comes at the cost of greater memory use.  Given that the main benefit of a bloom filter is its memory efficiency, a balance must be struck in choosing the bit vector size.  If a desired false positive rate p, and the expected number of elements n that will be added to the filter are known, then the optimal size of the underlying bit vector is given by the expression -(n*ln(p))/(ln(2)^2), where ln is the natural log.  The static function optimal_size() can be used to calculate this value if n and p are known.
        
        The hash_count specified will determinte the number of hash functions used when adding elements and checking membership.  Choosing the optimal number of hash functions to use depends on the size of the underlying bit vector used, and the expected number of elements to be added to the filter.  If we let m be the size of the underlying bit vector, and n the expected number of elements to be added, then the optimal number of hash functions is given by the expression ln(2)*m/n, where ln is the natural log.  The static function optimal_hash_count() can be used to calculate this value if m and n are known.
        
        Note that once a bloom filter is created, elements may not be removed, and the filter may not be re-sized.  That is, as elements are added to the filter, it will continue to monotonically approach its maximum allowed false-positive rate.  As such, it is important to pick appropriate values for each of the necessary parameters, and to monitor the expected probability of false-positives as elements are added (which can be done via the expected_fp() function).

        INPUT:
            -iterable -- an iterable collection, from which all elements will be initially added to the filter
            -size -- the size of the underlying bit vector to be used for the filter
            -max_fp_rate -- the maximum allowable rate of expected false positives
            -hash_count -- the number of hash functions to use
        """
        self.bits = Bitset(capacity=size)
        self.size = size
        self.max_fp_rate = max_fp_rate
        self.hash_count = hash_count
        self.num_inserts = 0 # used for false-positive probability calculations
        # add all elements if non-empty iterable is given 
        if (iterable is not None):
            for elmt in iterable:
                try:
                    self.add(elmt)
                except ValueError:
                    raise ValueError("maximum allowed false positive rate does not allow for all elements in iterable to be added")

    def __repr__(self):
        """
        Returns a string representing the given bloom filter.  The following information is included in this string: capacity of the underlying bit set, number of hash functions used, maximum allowed false-positive rate, and the underlying bitset itself.
        
        EXAMPLES::
            sage: Bloomfilter(size=8, max_fp_rate=0.25, hash_count=4)            
            Bloomfilter(size=8, hash_count=4, max_fp_rate=0.250000, bits=00000000)
        """
        return "Bloomfilter(size=%i, hash_count=%i, max_fp_rate=%f, bits=%s)" % (self.size, self.hash_count, self.max_fp_rate, repr(self.bits))

    def __eq__(self, other):
        """
        Checks for equality between other and self.  Returns true if and only if other is an instance of bloom filter, with the same allowed false positive rate, and the exact same bit vector state as self; otherwise false.
        
        Note that, due to the nature of how a bloom filter stores its members (i.e. in hashed bits, rather than the members themselves), it is possible that two bloom filters with entirely different member sets could test true for equality.  Though this sense of equality may intuitively seem odd, this is intended behavior; that is, two filters may be used interchangeably a point in which their bitsets are equal, so two such filters are in fact equal.
        
        Further note that, in the testing of this function, the above consideration may be important if tests are failing.  That is, a test may fail simply due to bad luck with hash functions (though this is unlikely), so this possiblity should always be explored before blaming the equality function itself.

        INPUT:
            -other -- a bloom filter, to test equality with self

        OUTPUT:
            a boolean, indicating equality of self and other
            
        EXAMPLES::
            sage: a = Bloomfilter(size=128, max_fp_rate=0.25, hash_count=4)
            sage: b = Bloomfilter(size=128, max_fp_rate=0.25, hash_count=4)
            sage: a == b
            True
            
            sage: a = Bloomfilter(size=64, max_fp_rate=0.25, hash_count=4)
            sage: b = Bloomfilter(size=128, max_fp_rate=0.25, hash_count=4)
            sage: a == b
            False
            
            sage: a = Bloomfilter(size=128, max_fp_rate=0.1, hash_count=4)
            sage: b = Bloomfilter(size=128, max_fp_rate=0.25, hash_count=4)
            sage: a == b
            False
            
            sage: a = Bloomfilter(size=128, max_fp_rate=0.25, hash_count=3)
            sage: b = Bloomfilter(size=128, max_fp_rate=0.25, hash_count=4)
            sage: a == b
            False
            
            sage: a = Bloomfilter(size=128, max_fp_rate=0.25, hash_count=4)
            sage: b = Bloomfilter(size=128, max_fp_rate=0.25, hash_count=4)
            sage: a.add("hello")
            sage: b.add("hello")
            sage: a == b
            True
            
            sage: a = Bloomfilter(size=128, max_fp_rate=0.25, hash_count=4)
            sage: b = Bloomfilter(size=128, max_fp_rate=0.25, hash_count=4)
            sage: a.add("hello")
            sage: b.add("hi")
            sage: a == b
            False
        """
        if isinstance(other, Bloomfilter):
            return ((self.size == other.size) and
                   (self.bits == other.bits) and
                   (self.max_fp_rate == other.max_fp_rate) and
                   (self.hash_count == other.hash_count))
        else:
            return NotImplemented

    def __ne__(self, other):
        """
        Checks for non-equality between other and self.  Returns false if and only if other is an instance of bloom filter, with the same allowed false positive rate, and exact same bit vector state as self; otherwise true.
        
        See documentation for eq method for special notes and considerations.

        INPUT:
            -other -- a bloom filter, to test non-equality with self

        OUTPUT:
            a boolean, indicating non-equliaty of self and other
            
        EXAMPLES::
            sage: a = Bloomfilter(size=128, max_fp_rate=0.25, hash_count=4)
            sage: b = Bloomfilter(size=128, max_fp_rate=0.25, hash_count=4)
            sage: a != b
            False
            
            sage: a = Bloomfilter(size=64, max_fp_rate=0.25, hash_count=4)
            sage: b = Bloomfilter(size=128, max_fp_rate=0.25, hash_count=4)
            sage: a != b
            True
            
            sage: a = Bloomfilter(size=128, max_fp_rate=0.1, hash_count=4)
            sage: b = Bloomfilter(size=128, max_fp_rate=0.25, hash_count=4)
            sage: a != b
            True
            
            sage: a = Bloomfilter(size=128, max_fp_rate=0.25, hash_count=3)
            sage: b = Bloomfilter(size=128, max_fp_rate=0.25, hash_count=4)
            sage: a != b
            True
            
            sage: a = Bloomfilter(size=128, max_fp_rate=0.25, hash_count=4)
            sage: b = Bloomfilter(size=128, max_fp_rate=0.25, hash_count=4)
            sage: a.add("hello")
            sage: b.add("hello")
            sage: a != b
            False
            
            sage: a = Bloomfilter(size=128, max_fp_rate=0.25, hash_count=4)
            sage: b = Bloomfilter(size=128, max_fp_rate=0.25, hash_count=4)
            sage: a.add("hello")
            sage: b.add("hi")
            sage: a != b
            True
        """
        if isinstance(other, Bloomfilter):
            return ((self.size != other.size) or
                   (self.bits != other.bits) or
                   (self.max_fp_rate != other.max_fp_rate) or
                   (self.hash_count != other.hash_count))
        else:
            return NotImplemented

    def __contains__(self, n):
        """
        Tests for possible membership of the hashable object n in self.  Note that "true" only means n is probabilistically a member of self, though this may not be the case; a "false", however, indicates with absolute certainty that n is not a member of self.
        
        Membership testing is meant to be carried out in exactly the same fashion as adding (though now hashed buckets are checked for a set bit, rather than performing the setting of the bit).  For any questions regarding the methodology used in membership testing, see documentation of add() for more details.
        
        Further, note that the behavior of the __contains__ function is exactly identical to the mightContain() function.  This is to allow the user to use whatever style of membership testing they prefer in their code.  "x in y" syntax (from __contains__) is preferable for elegance, but "y.mightContain(x)" might provide a more clear indication that membership testing is only probabilistic.

        INPUT:
            -n -- an object, to test for membership in self

        OUTPUT:
            a boolean, indicating if n is possibly a member of self
            
        EXAMPLES::
            sage: a = Bloomfilter(size=128, hash_count=3, max_fp_rate=0.25)
            sage: a.add(5)
            sage: 5 in a
            True
           
            sage: a.add("skateboard")
            sage: "skateboard" in a
            True
            
            sage: 6 in a
            False
            
            sage: set() in a
            False
        """
        if isinstance(n, basestring):
            # have a string - just use murmur hash on string itself
            for i in range(self.hash_count):
                hash_val = mmh3.hash(n,i) % self.size
                if not hash_val in self.bits:
                    return False
            return True 
        elif isinstance(n, collections.Hashable):
            # have a hashable non-string; take first hash, then continually re-hash str(previous hash)
            last_hash = hash(n)
            for i in range(self.hash_count):
                last_hash = mmh3.hash(str(last_hash),i) % self.size
                if not last_hash in self.bits:
                    return False
            return True
        else:
            # have a non-hashable object, cannot possibly be in filter (see add())
            return False
        
    def mightContain(self, n):
        """
        Tests for possible membership of the hashable object n in self.  Note that "true" only means n is probabilistically a member of self, though this may not be the case; a "false", however, indicates with absolute certainty that n is not a member of self.
        
        Further, note that the behavior of the __contains__ function is exactly identical to the mightContain() function.  This is to allow the user to use whatever style of membership testing they prefer in their code.  "x in y" syntax (from __contains__) is preferable for elegance, but "y.mightContain(x)" might provide a more clear indication that membership testing is only probabilistic.

        INPUT:
            -n -- an object, to test for membership in self

        OUTPUT:
            a boolean, indicating if n is possibly a member of self
            
        EXAMPLES::
            sage: a = Bloomfilter(size=128, hash_count=3, max_fp_rate=0.25)
            sage: a.add(5)
            sage: a.mightContain(5)
            True
           
            sage: a.add("skateboard")
            sage: a.mightContain("skateboard")
            True
            
            sage: a.mightContain(6)
            False
            
            sage: a.mightContain(set())
            False
        """
        return n in self

    def add(self, n):
        """
        Inserts hashable object n into self.  Note that n is not retrievable in the future (as only the bits resulting from the hash of n are retained), but, following the insertion, self will always return true when testing n for membership.
        
        Note that the current implementation of the hashing scheme has NOT been tested for a uniform spread for non-string objects.  That is, for strings that are added, the set of murmur hash functions is used to hash the string.  Murmur has been shown to possess good distribution over random strings, and may thus be trusted to do so for added strings in the bloom filter.  However, murmur operates on strings, and no general-purpose hash function was found that both works on any hashable object type, and allows for multiple hash functions (similar to how murmur may be seeded).  The current implementation of Bloomfilter then, uses the set of murmur hash functions to hash and re-hash the result of any hashable object's built-in __hash__ value, put into string form.  This should not necessarily be trusted to give an optimal distribution of hash values, and for specific use cases of bloom filters, it will often be a good idea to create a subclass of Bloomfilter, with a more implemntation-specific hashing scheme for the add() and contains() methods.
        
        Note that the add() method works on an element-wise basis.  If the contents of a collection are to be added to a filter, then they must each be added individually.

        INPUT:
            -n -- a hashable object, to add to self
            
        EXAMPLES::
            sage: a = Bloomfilter(size=16, hash_count=3, max_fp_rate=1.0)
            sage: a.add(5); a
            Bloomfilter(size=16, hash_count=3, max_fp_rate=1.000000, bits=0000100000000100)
            
            sage: a.add(5); a.add(5); a.add(5); a
            Bloomfilter(size=16, hash_count=3, max_fp_rate=1.000000, bits=0000100000000100)
            
            sage: a.add("skateboard"); a
            Bloomfilter(size=16, hash_count=3, max_fp_rate=1.000000, bits=0000100010000101)
        """
        if isinstance(n, basestring):
            # have a string - just hash it each time
            for i in range(self.hash_count):
                hash_val = mmh3.hash(n,i) % self.size # uses the i-th murmur hash function - thereby providing necessary multiple hash functions
                self.bits.add(hash_val)
        elif isinstance(n, collections.Hashable):
            # have a hashable non-string; take first hash, then continually re-hash str(previous hash)
            last_hash = hash(n)
            for i in range(self.hash_count):
                last_hash = mmh3.hash(str(last_hash),i) % self.size
                self.bits.add(last_hash)
        else:
            raise TypeError("unhashable type: '%s'" % n.__class__.__name__)
        # increment number of inserted elements - for false-positive estimation purposes
        self.num_inserts += 1
        # check to insure that insertion does not cause maximum false-positive rate to be exceeeded
        if (self.expected_fp() > self.max_fp_rate):
            raise ValueError("insertion causes maximum fp rate to be exceeded")
        

    def union(self, other):
        """
        Returns a new Bloomfliter representing the union of the underlying bit vectors for self, and another bloom filter; this is semantically equivalent to taking the union of the member sets of the two filters, as any element that is a member of one will also be a member of the resulting bloom filter.  The returned filter will take on size equal to the maximum of self and other (as is necessary for the union-ing of the two bit vectors), and maximum allowed false positive rate and hash count equal to those of self.
        
        Note that, due to the adoption of self's maximum allowed false positive rate and number of hash count, it is possible that a.union(b) will not be equal to b.union(a) for two bloom filters a and b.  This allows the user the flexibility to select which filter's false positive rate and hash count are desired for the resultant bloom filter, while still guaranteeing that the underlying bit vector returned is large enough to fit the data stored in both filters.
        
        Further note that, if the maximum false positive rate of the resultant bloom filter is exceeded by taking the union of the two underlying bit vectors, it is possible that the vector will be resized by default in order to accommodate the underlying bit vector's saturation.  Thus, in certain cases the size of the returned filter may not be the maximum of sizes of self and other, but rather the result of a re-sizing.

        INPUT:
            -other -- a bloom filter, to union with self

        OUTPUT:
            a bloom filter, the union of other and self
            
        EXAMPLES::
            sage: a = Bloomfilter(size=8, hash_count=2, max_fp_rate=1.0)
            sage: a.add(5)
            sage: a
            Bloomfilter(size=8, hash_count=2, max_fp_rate=1.000000, bits=00001100)

            sage: b = Bloomfilter(size=8, hash_count=2, max_fp_rate=1.0)
            sage: b.add("skateboard")
            sage: b
            Bloomfilter(size=8, hash_count=2, max_fp_rate=1.000000, bits=10000001)
                    
            sage: a.union(b)
            Bloomfilter(size=8, hash_count=2, max_fp_rate=1.000000, bits=10001101)
        """
        if not isinstance(other, Bloomfilter):
            raise TypeError("may not union Bloomfilter with object of type: '%s'" % other.__class__.__name__)
        new_size = max(self.size, other.size)
        res = Bloomfilter(size=new_size, max_fp_rate=self.max_fp_rate, hash_count=self.hash_count)
        res.bits = self.bits.union(other.bits)
        # insure that maximum allowed false-positive rate has not been exceeded
        if (res.expected_fp() > res.max_fp_rate):
            raise ValueError("maximum allowed false-positive rate is exceeded by union")
        return res

    def getVectorSize(self):
        """
        Returns the size of the underlying bit vector.

        OUTPUT:
            an integer, representing the total number of buckets in self's underlying bit vector
            
        EXAMPLES::
            sage: a = Bloomfilter(size=8, hash_count=2, max_fp_rate=0.25)
            sage: a.getVectorSize()
            8
            
            sage: b = Bloomfilter(size=1024, hash_count=2, max_fp_rate=0.25)
            sage: b.getVectorSize()
            1024
        """
        return self.size

    def getLoadFactor(self):
        """
        Returns the load factor of the underlying bit vector.  This is the number of set bits in the vector, divided by the size of the vector (i.e. the fraction of the vector with set bits).

        Note that the expectedFp function returns a more descriptive statistic (i.e. how often you may expect false positives), but the load factor returns a value that is completely independent of the number of hash functions used.

        OUTPUT:
            a number, the number of set bits in the underlying bit vector divided by the total size of the vector
            
        EXAMPLES::
            sage: a = Bloomfilter(size=8, hash_count=2, max_fp_rate=1.000000)
            sage: a.getLoadFactor()
            0
            
            sage: a.add(4)
            sage: a.getLoadFactor()
            1/4
        """
        return sum([1 for _ in self.bits]) / self.size

    def __copy__(self):
        """
        Returns a shallow copy of self.  Note that the underlying bit vector in the returned copy is simply a reference to the vector in self, so changes to one (i.e. the addition of any new members to the filter) will affect the other.

        OUTPUT:
            a bloom filter, the shallow copy of self
            
        EXAMPLES::
            sage: import copy
            sage: a = Bloomfilter(size=8, hash_count=2, max_fp_rate=1.0)
            sage: a.add(4)
            sage: b = copy.copy(a)
            sage: b == a
            True
            
            sage: a.add(5)
            sage: a.add(6)
            sage: b == a
            True
        """
        copy = Bloomfilter(size = self.size,
                           max_fp_rate = self.max_fp_rate,
                           hash_count = self.hash_count)
        copy.bits = self.bits
        return copy

    def __deepcopy__(self, memodict={}):
        """
        Returns a deep copy of self.

        INPUT:
            -memodict -- a dictionary, standard memoization dictionary for faster copying; should be left to the default value of {} when using deepcopy

        OUTPUT:
            a bloom filter, the deep copy of self
            
        EXAMPLES::
            sage: import copy
            sage: a = Bloomfilter(size=8, hash_count=2, max_fp_rate=1.0)
            sage: a.add(4)
            sage: b = copy.deepcopy(a)
            sage: b == a
            True
            
            sage: a.add(5)
            sage: a.add(6)
            sage: b == a
            False
        """
        copy = Bloomfilter(size = self.size,
                           max_fp_rate = self.max_fp_rate,
                           hash_count = self.hash_count)
        for i in self.bits:
            copy.bits.add(i)
        return copy

    def expected_fp(self):
        """
        Returns the expected false-positive probability for membership testing in self. If we let k be the number of hash functions used, m be the size of self's underlying bit vector, and n b the number of elements added to self, then this rate is estimated to be (1 - e^(-kn/m))^k, where e is the base of the natural logarithm.  This probability assumes that the hash functions used are well distributed (see the add() method for more information).  Note that this value is based on the size of the underlying bit vector, the number of set bits, and the number of hash functions used for the filter; for the pure size of the vector, or number of set bits, see getVectorSize() and getLoadFactor().
        
        Note that the function returns an exact representation of the expected probability; if an approximation is desired, the user may simply wrap the returned result (e.g. float(a.expectedFp())).

        OUTPUT:
            a decimal, the expected rate of false positivies for self
            
        EXAMPLES::
            sage: a = Bloomfilter(size=8, hash_count=2, max_fp_rate=1.0)
            sage: a.add(4)
            sage: a.expected_fp()
            (e^(-1/4) - 1)^2
        """
        return (1 - e^(-self.hash_count * self.num_inserts / self.size))^self.hash_count
   
    @staticmethod
    def optimal_size(p, n):
        """
        Computes the optimal size to be used for the underlying bit vector in a bloom filter, for a given maximum false-positive rate p and expected number of element insertions n.  The value is calculated via the expression -(n*ln(p))/(ln(2)^2), where ln is the natural logarithm; this value is rounded to the nearest integer value, which is returned.  If the rounded value is 0, then 1 is returned.
        
        Note that if a user wishes to use a bloom filter with arbitrarily poor membership-testing accuracy (i.e. a maximum allowed false positive rate of 1.0), then the results of this function should not be used to determine the size of the bloomfilter.  That is, the result will be rounded to 1, which renders the bloom filter completely useless.
        
        INPUT:
            -p -- a decimal, the desired maximum false-positive rate
            -n -- an integer, the expected number of element insertions
            
        OUTPUT:
            an integer, the (rounded) optimal size to use in the underlying bit vector for a bloom filter
            
            EXAMPLES::
                sage: Bloomfilter.optimal_size(0.5, 100)
                144
        """
        res = round(- (n * ln(p))/(ln(2))^2)
        return res if res > 0 else 1
    
    @staticmethod
    def optimal_hash_count(m, n):
        """
        Computes the optimal number of hash functions to use in a bloom filter, for a given bit vector size m and expected number of element insertions n.  The value is calculated via the expression (m/n)*ln(2), where ln is the natural logarithm; this value is rounded to the nearest integer value, which is returned.  If the rounded value is 0, then 1 is returned.
        
        INPUT:
            -m -- an integer, the number of bits in the bloom filter
            -n -- an integer, the expected number of element insertions
            
        OUTPUT:
            an integer, the (rounded) optimal number of hash functions to use
            
        EXAMPLES::
            sage: Bloomfilter.optimal_hash_count(500, 100)
            3
            
            sage: Bloomfilter.optimal_hash_count(10,5)
            1
        """
        res = round((m/n) * ln(2))
        return res if res > 0 else 1
︡7b96e0cf-94a0-4ca5-9519-cf2f3818ea99︡
︠b3572afb-c2d8-4935-8882-6628478a0b03︠
import os

class Filefilter(Bloomfilter):
    def add_tree(self, file_tree):
        for _,_,filelist in os.walk(file_tree):
            for fname in filelist:
                self.add(fname)
︡b15e606b-5e11-466f-bdc2-c7a5aa92c72c︡
︠25a0a21a-465e-4f16-925a-5e98102f3ba0︠
b = Filefilter(size=1000, max_fp_rate=1.0, hash_count=2)
b.add_tree("/projects/9fe03eb3-3e5e-4004-a017-e1fc8881c73f/your-graded-homework")
b.mightContain("hw6.sagews")
b.mightContain("alksjdflkj")
︡36203c98-0cc5-4f8a-acdf-5158b1ea4827︡{"stdout":"True\n"}︡{"stdout":"False\n"}︡
︠27e5838b-aebf-4be8-a58b-24be272abbd1︠
































