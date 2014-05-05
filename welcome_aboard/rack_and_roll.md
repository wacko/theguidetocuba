Rack & Roll!
============

As we mentioned earlier, Cuba is built on top of Rack ... but what is Rack?

Rack deals with HTTP requests. It provides a minimal interface between web
servers supporting Ruby and Ruby frameworks. Without Rack, Cuba would have
to implement its own handler for each web server.

![graph](https://raw.githubusercontent.com/frodsan/theguidetocuba/master/assets/rack.png)

You didn't notice yet but we already used Rack. We used `rackup`, one of
the tools that comes with Rack, to run our **"Hello Cuba!"** application.
When you start an application with `rackup`, it figures out which server
you have available.

When we executed `rackup config.ru`, it fired up **WEBrick**, a web server
built into Ruby by default.

```
$ rackup config.ru
[2014-05-03 23:10:57] INFO  WEBrick 1.3.1
...
```

To use `rackup`, you need a config file with the `.ru` extension. In this
file you specify which object handles the request and response objects
that are created by the Rack interface.

That's what we did inside our `config.ru` file. The last line tells Rack
that

```ruby
run(Cuba)
```
