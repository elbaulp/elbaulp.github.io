;; Functions
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


(defun get-string-from-file (filePath)
  "Return filePath's file content.
  (http://ergoemacs.org/emacs/elisp_read_file_content.html)"
  (with-temp-buffer
    (insert-file-contents filePath)
    (buffer-string)))
