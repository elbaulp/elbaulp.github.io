;;;;;;;;;;;;;;;;;;;;;;;
;; Misc Functions    ;;
;;;;;;;;;;;;;;;;;;;;;;;
(defun elbaul/filter-path (path list)
  "Return sublist containing path as parent"
  (cdr
   (elt
    (car
     (seq-drop-while
      (lambda (x)
        (not (string-match path (car x)))) list)) 1))
)


(defun s-replace (old new s)
  "Replaces OLD with NEW in S."
  (declare (pure t) (side-effect-free t))
  (replace-regexp-in-string (regexp-quote old) new s t t))


(defun get-string-from-file (filePath)
  "Return filePath's file content.
  (http://ergoemacs.org/emacs/elisp_read_file_content.html)"
  (with-temp-buffer
    (insert-file-contents filePath)
    (buffer-string)))



;;;;;;;;;;;;;;;;;;;;;;;
;; Sitemap Functions ;;
;;;;;;;;;;;;;;;;;;;;;;;
(defun duncan/latest-posts-sitemap-function (title sitemap)
  "posts.org generation. Only publish the latest 5 posts from SITEMAP (https://orgmode.org/manual/Sitemap.html).  Skips TITLE."
  (let* ((posts (cdr sitemap))
         (posts (duncan/org-publish-sitemap--valid-entries posts))
         (posts (elbaul/filter-path "org-posts" posts))
         (last-five (seq-subseq posts 0 (min (length posts) 5)))
         )
    (org-list-to-org (cons (car sitemap) last-five))
    )
  )


(defun duncan/org-publish-sitemap--valid-entries (entries)
  "Filter ENTRIES that are not valid or skipped by the sitemap entry function."
  (-filter (lambda (x) (car x)) entries))


(defun elbaulp/sitemap-function (title sitemap)
  "Generate the full list of posts"
  (let* ((header "#+setupfile: ./static/org-templates/level-0.org\n#+title:%s\n#+options: toc:nil\n* %s\n")
         (title "Blog Sitemap") (subtitle "All list of all blog posts")
         (posts (cdr sitemap))
         (posts (duncan/org-publish-sitemap--valid-entries posts))
         (posts (elbaul/filter-path "org-posts" posts))
         )
    (concat (format header title subtitle)
            (org-list-to-org (cons (car sitemap) posts))
            )))

;;;;;;;;;;;;;;;;;;;
;; RSS functions ;;
;;;;;;;;;;;;;;;;;;;
(defun duncan/sitemap-for-rss-sitemap-function (title sitemap)
  "Publish rss.org which needs each entry as a headline."
  (let* ((title "Blog") (subtitle "Archive")
         (posts (cdr sitemap))
         (posts (duncan/org-publish-sitemap--valid-entries posts)))
    (concat (format "#+TITLE: %s\n\n" title)
            (org-list-to-generic
             posts
             (org-combine-plists
              (list :splice t
                    :istart nil
                    :icount nil
                    :dtstart " " :dtend " "))))))


(defun duncan/sitemap-for-rss-sitemap-format-entry (entry style project)
  "Format ENTRY for rss.org for excusive use of exporting to RSS/XML. Each entry needs to be a headline. STYLE is not used."
  (let* ((base-directory (plist-get (cdr project) :base-directory))
         (filename (expand-file-name entry (expand-file-name base-directory ".")))

         (title (duncan/post-get-metadata-from-frontmatter filename "TITLE"))
         ;;(title (org-publish-format-file-entry "%t" filename project))
         ;;(title (org-publish-find-title filename project))
         (date (format-time-string "<%Y-%m-%d>" (org-publish-find-date entry project)))
         (draft? (duncan/post-get-metadata-from-frontmatter filename "DRAFT")))
    (unless (or (equal entry "404.org") draft?)
      (with-temp-buffer
             (insert (format "* [[file:%s][%s]]\n" entry title))
             (org-set-property "RSS_PERMALINK" (concat "posts/" (file-name-sans-extension entry) ".html"))
             (org-set-property "RSS_TITLE" title)
             (org-set-property "PUBDATE" date)
             ;; to avoid second update to rss.org by org-icalendar-create-uid
             ;;(insert-file-contents entry)
             (buffer-string))))
              )
