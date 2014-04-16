Installing Dependencies
=======================

The generated application comes with some scripts to make your development
life easier. One of those is the setup task, which will get you ready to
start hacking. To use this script, go to the command line and type the
following command as shown in [Example 1-2](#example12).

```html
$ make setup
```

A few things happened. First, the script created an `env.sh` file with the
basic configurations that we need to get the application running, like the
url for the Redis instance and the keys for setting the session (TODO: Improve
this ending, investigate about Rack::Session and how to explain it). Finally,
it installed the following gems: [gs](https://github.com/soveran/gs)
[dep](https://github.com/cyx/dep), and [shotgun](https://github.com/rtomayko/shotgun).

These gems are very helpful for the development environment. Usage of `gs` is
not required to complete this guide, but it's highly recommendable to read
["Appendix A: Managing your dependencies "The Right Way"](#appendixA).

Usage of `shotgun` is explained in more detail in the next section
["Up and Running"](#upandrunning).

Dep is a tool for tracking dependencies in a project. This is very helpful if you
want to know the list of gems a project is using, share it with someone else or
just don’t go insane installing all the dependencies you need.

Open up your favorite text editor and enter the contents in [Example 1-2](#example12).
This file serves as a manifest of the dependencies for our project.

```html
cuba -v 3.1.0
cuba-contrib -v 3.1.0
ohm -v 2.0.0.rc1
```

Finally, save this file as `.gems` and install all the listed gems by
typing `dep install` in the command line.

TODO: Change next paragraph to a table explain each dependency of the project.

You will understand the purpose of each dependency over the course of this guide.
If you want to know more about the features provided by [dep](https://github.com/cyx/dep),
please visit the project [homepage](http://twpil.github.com/dep).
