FROM iquiw/alpine-emacs:latest

WORKDIR /root

RUN apk update && apk add --update npm
RUN npm install html-minifier-terser -g
COPY projects.lisp index.org build.sh ./
COPY static/org-templates static/org-templates
COPY static/hugo static/hugo
CMD ["./build.sh"]
