<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
  <link rel="stylesheet" type="text/css" href="◊build-path[@prefix]{assets/style.css}">
  <title>◊(or (select 'title metas) (select 'h1 doc)) - 莊子</title>
</head>
<body>
<div id="container" class="with-paragraph-num">
◊(map ->html (select-from-doc 'root here))
</div>
<nav id="navigator">
◊(local-require pollen/setup)
◊(local-require racket/path)

◊(define prev-page (previous here))
◊(define next-page (next here))

◊(define prev-page-path (if prev-page (build-path @prefix (symbol->string prev-page)) #f))
◊(define next-page-path (if next-page (build-path @prefix (symbol->string next-page)) #f))

◊(define prev-page-title (if prev-page (select 'h1 (get-doc prev-page)) #f))
◊(define next-page-title (if next-page (select 'h1 (get-doc next-page)) #f))

◊when/splice[prev-page]{
<span id="link-prev">前篇：<a href="◊|prev-page-path|">◊|prev-page-title|</a></span>
}
<span id="link-home"><a href="◊build-path[@prefix]">目錄</a></span>
◊when/splice[next-page]{
<span id="link-next">次篇：<a href="◊|next-page-path|">◊|next-page-title|</a></span>
}
</nav>
</body>
</html>
