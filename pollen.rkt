#lang racket/base

(require racket/list
         pollen/core
         pollen/decode
         txexpr)

; overwrite some default values here if you want
(module setup racket/base
  (provide (all-defined-out))
  ; not really working...
  (define publish-directory (build-path (current-directory) "../publish")))

; remember to splice it in template!
(define (root . items)
  (define first-pass (decode (txexpr 'root '() items)
                      #:txexpr-elements-proc decode-paragraphs
                      #:exclude-tags '(style script)))
  (let* ([elems (get-elements first-pass)]
         ; make the first "paragraph" title
         [title (car elems)]
         [title (list-set title 0 'h1)]
         ; let the rest intact
         [paragraphs (cdr elems)])
        (txexpr (get-tag first-pass) (get-attrs first-pass) (cons title paragraphs))))

(provide root)

; used for specifying absolute path of assets
(define @prefix (if (equal? (getenv "POLLEN") "gh-pages")
                 "/zhuangzi"
                 "/"))
(provide @prefix)
