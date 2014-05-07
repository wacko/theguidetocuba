Up and Running
==============

Now that we've installed the dependencies, it's time to see how our
minimal application looks.

To get it up and running, we need to create a file with some
configurations. Go to the command line and type:

```
$ make setup
echo APP_KEY=$(basename $(pwd)) >> env.sh
echo APP_SECRET=$(make secret | grep -v 'ruby') >> env.sh
echo REDIS_URL=redis://127.0.0.1:6379/ >> env.sh
```

As you can see, this created a file called *env.sh*. For now, it's enough
for you to know that this file contains sensitive configurations for the
application. We'll discuss this in more detail later.

To see the application in action, type `make server` in the command line.

![shotgun](https://raw.githubusercontent.com/frodsan/theguidetocuba/master/assets/shotgun.png)
