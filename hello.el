#! /usr/bin/emacs -batch
;;
;; Run me from a Unix shell: ./hello.el > x.txt
;;
(message "Hello world!  I'm writing to STDERR.")
(print "Hello world!  I'm writing to STDOUT but I'm in quotes")
(insert "Hello world!  I'm writing to an Emacs buffer")
(write-file "y.txt")(message "Hello world!  I'm writing to STDERR.")
(print "Hello world!  I'm writing to STDOUT but I'm in quotes")
(insert "Hello world!  I'm writing to an Emacs buffer")
(write-file "y.txt")
