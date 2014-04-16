class RationalNumber:
    """
    EXAMPLES::

        sage: RationalNumber(78,-33484)
        -39/16742
    """
    def __init__(self, n, d):
        if d < 0:
            (n, d) = (-n, -d)
        g = gcd(n,d)
        self.n = n // g
        self.d = d // g
    def __repr__(self):
        return "%s/%s"%(self.n, self.d)

    def __add__(self, right):
        """
        EXAMPLES::

            sage: s = RationalNumber(2,3)
            sage: t = RationalNumber(3,7)
            sage: s + t
            23/21
            sage: s + 'funny thing'
            Traceback (most recent call last):
            ...
            TypeError
        """
        if not isinstance(right, RationalNumber):
            raise TypeError
        return RationalNumber(self.n*right.d + self.d*right.n, self.d*right.d)
