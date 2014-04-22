Managing Dependencies
=====================

In every web application, there are common tasks that you need to do.
For example, authenticate users or query a database. Libraries are useful
for not reinventing the wheel. In Ruby, they are often referred to as
**gems**.

Ruby uses [Rubygems](https://rubygems.org/) to distribute and ease the
installation of them. So, installing Cuba is as easy as typing
`gem install cuba` in the command line.

The Ugly Part
-------------

Even though **Rubygems** is useful when installing gems, it has its
limitations. Unfortunately, Rubygems installs all gems globally and
because Ruby only loads one version of a gem at a time, you will need
to check if you're not overlapping versions between projects.

Also, another problem that is not solved is keeping track of all the
gems you need for your project and the right version of each one.
