The View
========

Suppose you have to write a big chunk of HTML code. You could write it
like this:

```ruby
Cuba.define do
  on root do
    res.write("
      <html>
        <head>
          <!-- ... -->
        </head>
        <body>
          <!-- ... -->
        </body>
      </html>
    ")
  end
end
```

The problem with this approach is that it's hard to reuse parts of
the HTML that every page uses, for example a navigation bar. Therefore,
we separate it into *views*, which are templates that gets converted to
HTML and sent back to the browser.

In this chapter, you'll learn how to use [Mote](https://github.com/soveran/mote),
a minimal template engine to render *views*.
