#!/bin/python3
from functools import reduce


def filter_paste(text):
    return reduce(lambda x, y: x+y.strip(" "), text.split("\n"), "")

if __name__ == "__main__":
    from sys import argv
    for i in argv[1:]: print(filter_paste(i))


