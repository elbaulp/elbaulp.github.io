#!/bin/sh
emacs --batch --no-init-file --load projects.lisp --funcall toggle-debug-on-error
