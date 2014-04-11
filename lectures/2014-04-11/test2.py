from sage.all import prod, Integer

def my_prod(*args):
    """
    This is my_prod in another file...
    """
    return prod(args)


my_data = [n**Integer(2) for n in range(Integer(10))]