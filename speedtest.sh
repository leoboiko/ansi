#!/bin/bash

export count=1024


./ansi -bold -magenta "Will test $count echoes."
echo

./ansi -bold -cyan "Timing builtin echo:"
time (
  i=0
  while [ $i -lt $count ]; do
    echo a somewhat long line of text to test >&- 2>&-
    i=$(( $i + 1 ))
  done
)
echo

./ansi -bold -cyan "Timing /bin/echo:"
time (
  i=0
  while [ $i -lt $count ]; do
    /bin/echo a somewhat long line of text to test >&- 2>&-
    i=$(( $i + 1 ))
  done
)
echo

source ./ansi

./ansi -bold -yellow "Timing ansi as bash library (simple):"
time (
  i=0
  while [ $i -lt $count ]; do
    astart bold >&- 2>&-
    echo a somewhat long line of text to test \
      >&- 2>&-
    astop bold >&- 2>&-

    i=$(( $i + 1 ))
  done
)
echo

./ansi -bold -yellow "Timing ansi as bash library (complex):"
time (
  i=0
  while [ $i -lt $count ]; do
    attrs -bold -underline -blink -reverse \
      -magenta -bgmagenta \
      a somewhat long line of text to test \
      >&- 2>&-
    i=$(( $i + 1 ))
  done
)
echo

./ansi -bold -red "Timing ansi as dash command (simple):"
time (
  i=0
  while [ $i -lt $count ]; do
    dash ./ansi -red -bold \
      a somewhat long line of text to test \
      >&- 2>&-

    i=$(( $i + 1 ))
  done
)
echo

./ansi -bold -red "Timing ansi as dash command (complex):"
time (
  i=0
  while [ $i -lt $count ]; do
    dash ./ansi -n -bold -underline -blink -reverse \
      -magenta -bgmagenta \
      a somewhat long line of text to test \
      >&- 2>&-
    i=$(( $i + 1 ))
  done
)
echo
