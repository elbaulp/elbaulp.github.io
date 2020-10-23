(require 'package)
(package-initialize)
(unless package-archive-contents
  (add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
  (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
  (package-refresh-contents))
(dolist (pkg '(htmlize dash))
  (unless (package-installed-p pkg)
    (package-install pkg)))

(require 'ox-publish)
(require 'dash)
(require 'htmlize)
(add-to-list 'load-path ".")
(load "ox-rss.el")
(load "util-functions.lisp")
(load "org-variables.lisp")


(setq org-publish-project-alist
      '(
        ("org-notes"
         :base-directory "."
         :base-extension "org"
         :exclude "static/.*\\|latests.org"
         :publishing-directory "public"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 6
         :section-numbers nil
         :auto-preamble t
         :auto-sitemap t
         :with-toc t
         :with-tags nil
         :sitemap-filename "latests.org"
         :sitemap-sort-files anti-chronologically
         :sitemap-function duncan/latest-posts-sitemap-function
         :makeindex t
         :html-use-infojs t
         :html-preamble t
         :html-postamble t
         :html-link-use-abs-url t
         )

        ("org-archive"
         :base-directory "."
         :recursive t
         :base-extension "org"
         :exclude "latests.org"
         :publishing-directory "public"
         :publishing-function ignore
         :html-link-home "https://elbauldelprogramador.com/"
         :html-link-use-abs-url t
         :auto-sitemap t
         :sitemap-filename "archive.org"
         :sitemap-sort-files anti-chronologically
         :sitemap-function elbaulp/sitemap-function
        )

        ("org-static"
         :base-directory "."
         :exclude "static/.*"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|yml"
         :publishing-directory "public"
         :recursive t
         :publishing-function org-publish-attachment
         )


        ;; ("sitemap-for-rss"
        ;;  :base-directory "."
        ;;  :recursive t
        ;;  ;; :exclude (regexp-opt '("latests.org" "archive.org" "rss.org"))
        ;;  :base-extension "org"
        ;;  :publishing-directory "public/"
        ;;  :publishing-function 'ignore
        ;;  :auto-sitemap t
        ;;  :sitemap-filename "rss.org"
        ;;  :sitemap-function duncan/sitemap-for-rss-sitemap-function
        ;;  :sitemap-format-entry duncan/sitemap-for-rss-sitemap-format-entry)

        ;; ("org-rss"
        ;;  :base-directory "."
        ;;  :recursive t
        ;;  :base-extension "org"
        ;;  :include '("rss.org")
        ;;  :exclude (regexp-opt '("latests.org" "archive.org" "rss.org"))
        ;;  :rss-image-url "https://elbauldelprogramador.com/img/bio-photo-rss.png"
        ;;  :publishing-directory "public/"
        ;;  :publishing-function org-rss-publish-to-rss
        ;;  :html-link-home "https://elbauldelprogramador.com"
        ;;  :html-link-use-abs-url t)

        ("org" :components ("org-archive" "org-notes" "org-static"))
        ))

(org-publish-remove-all-timestamps)
(org-publish "org" t )
