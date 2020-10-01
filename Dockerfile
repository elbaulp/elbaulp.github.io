FROM iquiw/alpine-emacs:latest

WORKDIR /root/blog

RUN apk update && apk add --update npm
RUN npm install html-minifier-terser -g
COPY theindex.org ox-rss.el projects.lisp index.org build.sh ./
COPY org-posts org-posts
COPY css css
COPY static/org-templates static/org-templates
COPY static/hugo static/hugo
RUN mkdir -p ~/.emacs.d/org-templates && \
    mv ./static/org-templates/* ~/.emacs.d/org-templates/ && \
    emacs --batch --no-init-file --load ./projects.lisp --funcall toggle-debug-on-error

ENTRYPOINT ["./build.sh"]
