#lang pollen

◊(define-meta template "template.index.html.p")
◊(current-pagetree (get-pagetree "index.ptree"))

◊(require racket/list)

︽莊子︾

︽二○○三年六月二十四日版︾

◊a[#:href "http://www.haodoo.net/?M=hd&P=wisdom-4"]{原始檔出自好讀 Haodoo}。

◊h2{目錄}


◊ul{
 ◊`(@ ,@(map (λ (s)
               (define path (format "~a" s))
               (define title (select 'h1 (get-doc path)))
               ◊li{◊a[#:href path]{◊title}})
             (cdr (current-pagetree))))
}
