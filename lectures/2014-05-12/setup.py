"""
setup.py  to build mandelbot code with cython

Build with Sage's Python via:

   sage setup.py build_ext --inplace

See http://docs.cython.org/src/userguide/source_files_and_compilation.html

"""

from distutils.core import setup
from Cython.Build import cythonize

setup(
    ext_modules = cythonize("mandel.pyx")
)