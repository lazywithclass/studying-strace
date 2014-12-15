Studying strace and its possible application in debugging running nodejs programs
=================================================================================


## System calls ##

All calls are documented, so `man call_name` is available.

### access() ###

Checks whether the calling process can access the file.

### brk() ###

brk(0) is a way to grab the processes current program break.
The program break is the location of the end of the data segment
(actually its the first location after), moving the program break up
has the effect of allocating more memory to the process, and moving it
down has the effect of deallocating it. This is the way malloc allocates memory.

(http://www.danielhall.me/tag/strace/)

## arch_prctl() ##

Set architecture-specific thread state.

### close() ###

Closes a file descriptor.

### execve() ###

Runs a program.

### mmap() / munmap() ###

Map or unmap files or devices into memory.

## mprotect() ##

Set protection on a region of memory.

### open() ###

Open and possibly create a file or device
Returns a file descriptor, a small, nonnegative integer for use in subsequent system calls .

## read() ##

Reads from a fd.

### stat() ###

Get file informations, similar to ls -l.

### write() ###

Writes something to a file descriptor.


## Examples ##

```
open("/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=98472, ...}) = 0
mmap(NULL, 98472, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7fddeb80b000
close(3)
```

Opens `/etc/ld.so.cache` and gets back the fd.
Gets info about that file descriptor.
?.
Closes the file descriptor.


## References ##

Links I've used to learn and write this.

 * http://chadfowler.com/blog/2014/01/26/the-magic-of-strace/

