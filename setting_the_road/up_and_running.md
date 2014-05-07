Up and Running
==============

Now that we've installed the dependencies, it's time to see how our
minimal application looks.

To get it up and running, we need to create a file with some
configurations. Go to the command line and type `make setup`.

![setup](https://raw.githubusercontent.com/frodsan/theguidetocuba/master/assets/setup.png)

As you can see, this created a file called *env.sh*. For now, it's enough
for you to know that this file contains sensitive configurations for the
application. We'll discuss this in more detail later.

To see the application in action, type `make server` in the command line.

![shotgun](https://raw.githubusercontent.com/frodsan/theguidetocuba/master/assets/shotgun.png)

Unlike before, we're now using *shotgun* instead of *rackup*. *Shotgun*
is a gem that reloads the application for every request. That's great for
development because we don't need to restart the server every time that
we change the application. Now navigate to <http://localhost:9393/>. It
should show the Cuba welcome page.

![home](https://raw.githubusercontent.com/frodsan/theguidetocuba/master/assets/home.png)
