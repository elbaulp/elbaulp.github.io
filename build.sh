#!/bin/sh
mkdir -p ~/.emacs.d/org-templates
cp -Rv /root/static/org-templates/* ~/.emacs.d/org-templates/
emacs --batch --no-init-file --load ./projects.lisp --funcall toggle-debug-on-error
cp -R /root/static/hugo/* public/
