#!/bin/bash

# we also passed the -s option to strace telling it the maximum string size
# we want it to print. this is helpful for showing expanded function arguments.
# here we pass 2000, which is abitrarily enough to see everything we need to see in this program

# the -f flag tells strace to follow any children of the program we execute

# the -T flag 

strace -s 2000 -fT node traceme.js
