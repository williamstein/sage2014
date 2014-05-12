# mandel.pyx

# inspired by https://github.com/cython/cython/wiki/examples-mandelbrot

import cython
import numpy as np

cdef inline int mandel(double real, double imag, int max_iterations=20):
    """
    Determines if a point is in the Mandelbrot set based on deciding if,
    after a maximum allowed number of iterations, the absolute value of
    the resulting number is greater or equal to 2.
    """
    cdef double z_real = 0., z_imag = 0.
    cdef int i

    for i in range(0, max_iterations):
        # square and add 1
        z_real, z_imag = ( z_real*z_real - z_imag*z_imag + real,
                           2*z_real*z_imag + imag )
        if (z_real*z_real + z_imag*z_imag) >= 4:
            return i
    return -1

def create_fractal( double min_x,
                    double max_x,
                    double min_y,
                    int nb_iterations,
                    colours,
                    image):

    cdef int width, height
    cdef int x, y, start_y, end_y
    cdef int nb_colours, colour
    cdef double real, imag, pixel_size

    nb_colours = len(colours)

    width = image.shape[0]
    height = image.shape[1]

    pixel_size = (max_x - min_x) / width

    for x in range(width):
        real = min_x + x*pixel_size
        for y in range(height):
            imag   = min_y + y*pixel_size
            colour = mandel(real, imag, nb_iterations)
            image[x, y, 0] = colours[ colour%nb_colours, 0 ]
            image[x, y, 1] = colours[ colour%nb_colours, 1 ]
            image[x, y, 2] = colours[ colour%nb_colours, 2 ]


def demo(size=500, nb_iterations = 20):
    import time

    def make_palette():
        """
        Sample coloring scheme for the fractal - feel free to experiment
        No need for this to be in Cython, but I put it here just to illustrate that pure Python works fine in Cython.
        """
        colors = []
        for i in range(0, 25):
            colors.append( (i*10, i*8, 50 + i*8), )
        for i in range(25, 5, -1):
            colors.append( (50 + i*8, 150+i*2,  i*10), )
        for i in range(10, 2, -1):
            colors.append( (0, i*15, 48), )
        return np.array(colors, dtype=np.uint8)

    min_x = -1.5
    max_x =  0
    min_y = -1.5

    bytearray = np.zeros((size, size, 3), dtype=np.uint8) + 125
    colors    = make_palette()
    start     = time.clock()
    create_fractal(min_x, max_x, min_y, nb_iterations, colors, bytearray)
    print "it took %f seconds to run"%( time.clock() - start)

    from scipy.misc import toimage
    toimage(bytearray).save("mandelbrot.png")
    return bytearray
