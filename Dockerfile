FROM iquiw/alpine-emacs:latest

WORKDIR /root

COPY projects.lisp index.org build.sh ./
COPY static/org-templates static/org-templates
COPY static/hugo static/hugo
CMD ["./build.sh"]
