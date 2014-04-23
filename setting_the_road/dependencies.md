Managing Dependencies
=====================

In every web application, there are common tasks that you need to do
(e.g authenticate users or query a database). Libraries are useful for
not reinventing the wheel, and in Ruby they are often referred to as
**gems**.

Ruby uses [Rubygems](https://rubygems.org/) to distribute them and to
ease the installation. Installing Cuba is as easy as typing
`gem install cuba` in the command line.

Even though **Rubygems** is useful when installing gems, it has its
limitations. Unfortunately, it installs all gems globally. It means
that if you have different versions of a gem installed, you have to
make sure that you require the right version for your project.

[Bundler](http://bundler.io/) is one of the most used tools to solve
this problem. It has approximately ~10k lines of code, that's more than
all the dependencies of this project put together. Because of this
complexity, we'll use a different approach in this book.

"The Right Way"
---------------

Back to the original problem, we need a way to keep track of the
dependencies and install the right version of each one. This is where
[gs](https://github.com/soveran/gs) and [dep](https://github.com/cyx/dep)
come to the rescue.

With **gs** you can create a **gemset** for each project. A **gemset**
is an isolated space to install gems. By providing each project with
their own gemset, you can be sure that the right version of a gem is
loaded.

While **gs** handles the gemset, **dep** keeps track of the dependencies
for your project, making it easier to install them.

To install **gs** and **dep**, use the `gem install` command:

```html
$ gem install gs
$ gem install dep
```

Before installing the dependencies of this project, you need a gemset.
Creating one is as easy as typing:

```html
$ gs init
```
