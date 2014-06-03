#You have to run the code in the terminal. You can play it in "play.term". 
#Type 'sage' and wait for few seconds, then type 'run -i "myproject.sagews"'.
#If you have any question, please email me. My email is kisabel@uw.edu
import random

retry = 'y'
while retry == 'y':
    # constants
    HANGMAN = (
    """
     ------
     |    |
     |
     |
     |
     |
     |
    ----------
    """, 
    """
     ------
     |    |
     |    O
     |
     |
     |
     |
    ----------
    """,
    """
     ------
     |    |
     |    O
     |    |
     | 
     |   
     |     
    ----------
    """,
    """
     ------
     |    |
     |    O
     |   /|
     |   
     |   
     |     
    ----------
    """,
    """
     ------
     |    |
     |    O
     |   /|\\
     |   
     |   
     |     
    ----------
    """,
    """
     ------
     |    |
     |    O
     |   /|\\
     |   
     |      
    ----------
    """,
    """
     ------
     |    |
     |    O
     |   /|\\
     |   /
     |       
    ----------
    """,
    """
     ------
     |    |
     |    O
     |   /|\\
     |   / \\
     |     
    ----------
    """)

    MAX_WRONG = len(HANGMAN) - 1
    
    WORDS = ["addition", "angle", "algebra", "binomial", "boxplot", "coefficient", "calculus", "convex", "coordinates", "curve", "difference", "denominator", "derivative", "diameter", "discrete", "dimension", "equation", "exponent", "finite", "function", "formula", "geometry", "hexagon", "hypothesis", "integral", "intercept", "interval", "inverse", "linear", "logarithm", "matrix", "numerator", "octagon", "parabola", "permutation", "product", "polynomial", "python", "quadratic", "quotient", "rational", "remainder", "subset", "scalar", "slope", "tangent", "triangle", "variable", "velocity", "volume"]
    

    # initialize variables
    word = random.choice(WORDS)   # the word to be guessed
    so_far = "-" * len(word)      # one dash for each letter in word to be guessed
    wrong = 0                     # number of wrong guesses player has made
    used = []                     # letters already guessed


    print "Welcome to Hangman.  Good luck!"

    while (wrong < MAX_WRONG) and (so_far != word):
        print HANGMAN[wrong]
        print "\nYou've used the following letters:\n", used
        print "\nSo far, the word is:\n", so_far

        guess = raw_input("\n\nEnter your guess: ")
        guess = guess.lower()
        
        while (guess in used):
            print "You've already guessed the letter:", guess
            guess = raw_input("Enter your guess: ")
            guess = guess.lower()

        used.append(guess)

        if (guess in word):
            print "\nYes!", guess, "is in the word!"

            # create a new so_far to include guess
            new = ""
            for i in range(len(word)):
                if guess == word[i]:
                    new += guess
                else:
                    new += so_far[i]              
            so_far = new

        else:
            print "\nSorry,", guess, "isn't in the word."
            wrong += 1

    if (wrong == MAX_WRONG):
        print HANGMAN[wrong]
        print "\nYou've been hanged!"
    else:
        print "\nYou guessed it!"
        
    print "\nThe word was", word
    retry = raw_input("Do you want to try again? (y/n) ")
    
#raw_input("\n\nPress the enter key to exit.")









