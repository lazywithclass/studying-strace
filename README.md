Studying strace and its possible application in debugging running nodejs programs
=================================================================================

## System calls ##

All calls are documented, so `man call_name` is available.

### accept() ###

It extracts the first connection request on the queue of pending connections
for the listening socket, sockfd, creates a new connected socket, and returns
a new file descriptor referring to that socket.

### access() ###

Checks whether the calling process can access the file.

### brk() ###

brk(0) is a way to grab the processes current program break.
The program break is the location of the end of the data segment
(actually its the first location after), moving the program break up
has the effect of allocating more memory to the process, and moving it
down has the effect of deallocating it. This is the way malloc allocates memory.

(http://www.danielhall.me/tag/strace/)

### arch_prctl() ###

Set architecture-specific thread state.

### clock_gettime() ###

Gets the time.

### close() ###

Closes a file descriptor.

### execve() ###

Runs a program.

### fcntl() ###

Performs a command on a file descriptor.

### mmap() / munmap() ###

Map or unmap files or devices into memory.

### mprotect() ###

Set protection on a region of memory.

### poll() ###

Waits for one of a set of file descriptors to become ready to perform I/O.
**TODO** - what is the difference with select?

### open() ###

Open and possibly create a file or device
Returns a file descriptor, a small, nonnegative integer for use in subsequent system calls .

### read() ###

Reads from a fd.

### select() ###

Waits for I/O to become available. For example it can wait for incoming connections.
**TODO** - what is the difference with poll?

### stat(), fstat() ###

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
