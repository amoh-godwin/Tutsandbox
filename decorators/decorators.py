from time import time

class CacheMan():

    def __init__(self, func):
        self.func = func
        self.cache = {}

    def __call__(self, *args, **kwargs):
        all_args = args + tuple(kwargs.values())

        for arg in all_args:
            if arg not in self.cache:
                self.cache[arg] = self.func(*args, **kwargs)

            return self.cache[arg]


def timer(func):

    def inner_function(*args, **kwargs):
        start = time()
        ret_val = func(*args, **kwargs)
        end = time()
        diff = end - start
        print(f"{func.__name__} took: {diff} seconds")
        return ret_val

    return inner_function

@CacheMan
@timer
def factorial(n):
    if n:
        return n * factorial(n-1)
    return 1

f3 = factorial(3)
print(f"Factorial 3 is {f3}")
f2 = factorial(2)
print(f"Factorial 2 is {f2}")
f4 = factorial(4)
print(f"Factorial 4 is {f4}")

