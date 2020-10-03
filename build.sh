#!/bin/sh

# Stop script when an error occurs
set -o errexit
set -o pipefail
set -o nounset

html-minifier-terser --collapse-whitespace --remove-comments --remove-optional-tags --remove-redundant-attributes --remove-script-type-attributes --remove-tag-whitespace --use-short-doctype --minify-css true --minify-js true --input-dir ./public/ --output-dir ./public --file-ext html
html-minifier-terser --collapse-whitespace --remove-comments --remove-optional-tags --remove-redundant-attributes --remove-script-type-attributes --remove-tag-whitespace --use-short-doctype --minify-css true --minify-js true --input-dir ./public/ --output-dir ./public --file-ext css
mv ./static/hugo/* ./public
