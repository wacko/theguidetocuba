Up and Running
==============

TODO: Explain why you need a config.ru.

Now, we can start the web server. Rack comes with a tool called `rackup` to achieve
this task, but we will use [shotgun](https://github.com/rtomayko/shotgun) in this
guide. Install it by running `gem install shotgun`.

Unlike `rackup`, Shotgun will reload the application every time a new request comes
in from the web browser. That's great for development because we don't need to restart
the server every time that we make changes to the application. To start up the web
server, use the `shotgun` command as shown in [Figure 1-2](#figure12).

{id="figure12"}
![Figure 1-2: Starting up the web server with Shotgun](images/chapter_1/shotgun.png)

This fired up WEBrick, a webserver built into Ruby by default. To see the
application in action, open a browser window and navigate to <http://localhost:9393/>.
It should show the greeting message displayed in [Figure 1-3](#figure13).

{id="figure13"}
![Figure 1-3: "Hello, Cuba!"](images/chapter_1/hello_world.png)

I> To stop the web server, hit `Ctrl+C` in the terminal window where it's running.
I> To verify the server has stopped you should see your command prompt cursor again.
I> Note that there are still cases where you need to restart the server, such as
I> installing a new gem for the project or changing an environment variable.
