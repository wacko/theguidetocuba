The Guide to Cuba
=================

To begin, let's take a moment to answer "what is Cuba?".

Cuba is a web application micro-framework written in Ruby by [Michel Martens][soveran].
It rides on [Rack][rack] so we have the benefits of middleware, Rack libraries, and a
variety of web servers for free.

Cuba is minimalist by design (∼170 lines of code) which makes it faster compared to
other web frameworks. Also, it doesn’t make assumptions about the "best" way to do
things. That gives us the freedom to choose the proper tools for the job.

Since Cuba doesn’t ship with all the tools we need to create our example application,
this guide will also introduce other libraries that share the same design philosophy.
Together, they make web development simple, understandable and fun.

I designed this guide for beginners who want to get started with a Cuba application
from scratch. But, you need to have some prerequisites installed:

* Ruby 2.0 or newer. You can get the latest Ruby distributions from the
  [Ruby download page](https://www.ruby-lang.org/en/downloads/).

* The [Redis](http://redis.io) database. If you haven't yet installed Redis, you can
  follow the instructions in the [Redis download page](http://redis.io/download).

* [Git](http://git-scm.com/), the version control system. You can follow the installation
  instructions at the [Installing Git section of Pro Git](http://www.git-scm.com/book/en/Getting-Started-Installing-Git).

I> ## A Note to Windows Users
I>
I> All the code examples have been tested only on OSX and Linux only.

By following this guide, we'll build a Twitter clone from scratch. You can get the
complete code [here](/code).

[soveran]: https://github.com/soveran
[rack]: http://rack.github.io
