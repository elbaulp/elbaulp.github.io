#!/bin/sh

# Stop script when an error occurs
set -o errexit
set -o pipefail
set -o nounset

mkdir -p ~/.emacs.d/org-templates
cp -Rv /root/static/org-templates/* ~/.emacs.d/org-templates/
emacs --batch --no-init-file --load ./projects.lisp --funcall toggle-debug-on-error
cp -R /root/static/hugo/* public/
html-minifier-terser --collapse-whitespace --remove-comments --remove-optional-tags --remove-redundant-attributes --remove-script-type-attributes --remove-tag-whitespace --use-short-doctype --minify-css true --minify-js true --input-dir ./public --output-dir ./public --file-ext html
html-minifier-terser --collapse-whitespace --remove-comments --remove-optional-tags --remove-redundant-attributes --remove-script-type-attributes --remove-tag-whitespace --use-short-doctype --minify-css true --minify-js true --input-dir ./public --output-dir ./public --file-ext css
