ansi
====

Shell script to print console text with ANSI colors and attributes.

There's a lot of shell scripts to print console text with colors and 
ANSI attributes, but this is mine.  It's mostly POSIX (runs fine on 
bash and dash), and can be used as a command or as a library.  Call 
with -h for command help.

For details see http://en.wikipedia.org/wiki/ANSI_escape_code .

Sample usage:

    ansi -red -bold Error: colorblind\!

    echo -n normal; ansi -n -cyan andblue; echo andnormal

    ansi -magenta -- -hyphen in start

