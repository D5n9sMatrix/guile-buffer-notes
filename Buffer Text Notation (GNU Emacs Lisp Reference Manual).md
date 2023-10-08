<!DOCTYPE html>
<!-- saved from url=(0083)https://www.gnu.org/software/emacs/manual/html_node/elisp/Buffer-Text-Notation.html -->
<html><!-- Created by GNU Texinfo 7.0.3, https://www.gnu.org/software/texinfo/ --><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Buffer Text Notation (GNU Emacs Lisp Reference Manual)</title>

<meta name="description" content="Buffer Text Notation (GNU Emacs Lisp Reference Manual)">
<meta name="keywords" content="Buffer Text Notation (GNU Emacs Lisp Reference Manual)">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="Generator" content="makeinfo">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link rev="made" href="mailto:bug-gnu-emacs@gnu.org">
<link rel="icon" type="image/png" href="https://www.gnu.org/graphics/gnu-head-mini.png">
<meta name="ICBM" content="42.256233,-71.006581">
<meta name="DC.title" content="gnu.org">
<style type="text/css">
@import url('/software/emacs/manual.css');
</style>
</head>

<body lang="en">
<div class="subsection-level-extent" id="Buffer-Text-Notation">
<div class="nav-panel">
<p>
Next: <a href="https://www.gnu.org/software/emacs/manual/html_node/elisp/Format-of-Descriptions.html" accesskey="n" rel="next">Format of Descriptions</a>, Previous: <a href="https://www.gnu.org/software/emacs/manual/html_node/elisp/Error-Messages.html" accesskey="p" rel="prev">Error Messages</a>, Up: <a href="https://www.gnu.org/software/emacs/manual/html_node/elisp/Conventions.html" accesskey="u" rel="up">Conventions</a> &nbsp; [<a href="https://www.gnu.org/software/emacs/manual/html_node/elisp/index.html#SEC_Contents" title="Table of contents" rel="contents">Contents</a>][<a href="https://www.gnu.org/software/emacs/manual/html_node/elisp/Index.html" title="Index" rel="index">Index</a>]</p>
</div>
<hr>
<h4 class="subsection" id="Buffer-Text-Notation-1">1.3.6 Buffer Text Notation</h4>
<a class="index-entry-id" id="index-buffer-text-notation"></a>

<p>Some examples describe modifications to the contents of a buffer, by
showing the before and after versions of the text.  These
examples show the contents of the buffer in question between two lines
of dashes containing the buffer name.  In addition, ‘<samp class="samp">∗</samp>’
indicates the location of point.  (The symbol for point, of course, is
not part of the text in the buffer; it indicates the place
<em class="emph">between</em> two characters where point is currently located.)
</p>
<div class="example">
<pre class="example-preformatted">---------- Buffer: foo ----------
This is the ∗contents of foo.
---------- Buffer: foo ----------

(insert "changed ")
     ⇒ nil
---------- Buffer: foo ----------
This is the changed ∗contents of foo.
---------- Buffer: foo ----------
</pre></div>

</div>





</body></html>