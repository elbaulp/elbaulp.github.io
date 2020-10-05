FROM iquiw/alpine-emacs:latest

WORKDIR /github/workspace

RUN apk update && apk add --update npm tree && \
    npm install html-minifier-terser -g
COPY theindex.org ox-rss.el projects.lisp index.org build.sh ./
COPY org-posts org-posts
COPY css css
COPY static/org-templates static/org-templates
COPY static/hugo static/hugo

ENTRYPOINT [ "./build.sh" ]
