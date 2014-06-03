class SQLCache:
    """
        Author: Connor Moore, University of Washington, June 2014
    
        An alternative to FileCache, SQLCache allows a user to cache key-value
    pairs from a session. Best used to avoid repeating expensive calculations.
    It can be used to create a decorator function, that will store results in
    a SQL database, and retrieve such results as necessary. Not for use with
    functions that don't follow the reflexive property. That is, if a fuction
    does not display the following behavior:
    
        f(x) = f(x)
        
        then the caching system will incorrectly return results from a previous
    f(x), that may no longer be correct.
    
        Functions are identified by name in the database, so two functions with
    the same name by default will access the same cache.
    
        NOTE: This is a difficult class to write EXAMPLES tests for, as the state
    of the databse is variable.
    """
    def __init__(self):
        """
        Initializes a new cache object
        
        Uses a set cache, "caches.db" as the database. The database has a table
        that is assumed to be set up, caches.
        """
        import sqlite3
        # initializing the connection and cursor for easy access
        # it is assumed that this database has a caches table named "caches"
        self.database = "cache_db/caches.db"
        self.__open_database__()
        
        # populating self.elements:
        self.elements = []
        self.curs.execute("SELECT name FROM caches");
        
        name = self.curs.fetchone()
        while name is not None:
            self.elements.append(name[0])
            name = self.curs.fetchone()
        self.__close_database__();
      
            
    def __open_database__(self):
        """
        Opens the database.
        
        Opens up the database, acting as a lock on
        the database for this object.
        
        NOTE: This function never needs to be used by
        a client of SQLCache.
        """
        import sqlite3
        self.conn = sqlite3.connect(self.database)
        self.conn.text_factory = str
        self.curs = self.conn.cursor()
        
        
    def __close_database__(self):
        """
        Closes the database.
        
        Closes access to the database, unlocking it
        for use by other versions of SQLCache objects.
        """
        import sqlite3
        self.conn.close()
        
   
    def __repr__(self):
        """
        Returns a string of this
        
        Returns a representation of this, in the form "[active caches]"
        """
        return str(self.elements)
    
        
        
    def get_cache_function(self, function):
        """
        Creates the file decorator for caching.
        
        Returns a function that is a caching version of the passed in function. The
        returned function, before running the function, will check the appropriate
        cache to determine whether or not an answer for the given input has already
        been computed. If it has, it will return the previously computed output and
        return it.
        """
        self.__open_database__()
        name = function.__name__
        self.curs.fetchall() # acts as a flush of the queries
        # ensuring that name table exists
        if self.elements.count(name) == 0:
            self.curs.execute("INSERT INTO caches VALUES(?)", (name,))
            self.curs.execute("CREATE TABLE " + name + "(input, output)")
            self.elements.append(name)
        def f(*args):
            self.__open_database__()
            self.curs.execute("SELECT output FROM " + name + " WHERE input = ?", (str(*args),))
            output = self.curs.fetchone()
            if output is None:
                output = function(*args)
                self.curs.execute("INSERT INTO " + name + " VALUES(?, ?)", (str(*args), str(output)))
                self.conn.commit()
            else:
                output = output[0]
            self.__close_database__()
            return output
        self.conn.commit()
        self.__close_database__()
        return f
        
        

    def remove_table_function(self, function):
        """
        Removes a table from the cache
        
        Given a function, will remove all cached information 
        associated with that function.
        """
        name = function.__name__
        self.remove_table_name(name)
        
        
    def remove_table_name(self, name):
        """
        Removes a table from the cache
        
        Given the name of a function, will remove all information
        associated with that function.
        """
        self.__open_database__()
        self.curs.execute("DELETE FROM caches WHERE name='" + name + "'")
        self.curs.execute("DROP TABLE " + name)
        self.conn.commit()
        self.elements.remove(name)
        self.__close_database__()
        
        
    def __contains__(self, function):
        """
        Determines if a table for the given function exists
    
        Given a function, returns true if data is contained for the given function,
        false otherwise.
        """
        return self.elements.count(function.__name__) != 0
    
    
    
    def __iter__(self, function):
        """
        Returns an iterable instance of the functions in this
        """
        return self.elements().__iter__()

    
    
    def get_elements(self):
        """
        Returns a list of functions cached
        
        Returns a list of functions cached in the database, by name.
        """
        # returning a copy so as to avoid tampering
        ret_elements = []
        for element in self.elements:
            ret_elements.append(element)
        return ret_elements
    
    
    
    def values(self, function):
        """
        For a given function, returns cached values
        
        Returns a list of cached values for function, in the form (**args, output)
        """
        self.__open_database__()
        self.curs.execute("SELECT input, output FROM " + function.__name__)
        result = self.curs.fetchall()
        self.__close_database__()
        
   
    def clear_cache(self):
        for element in self.elements:
            self.remove_table_name(element)
        self.__open_database__()
        self.curs.execute("DELETE FROM caches WHERE name = '*'")
        self.__close_database__()
        self.elements = []