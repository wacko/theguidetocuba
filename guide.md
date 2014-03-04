A catchy introduction title here
--------------------------------

To begin, let's take a moment to answer "what is Cuba?".

Cuba is a web application micro-framework written in Ruby by [Michel Martens][soveran].
It rides on Rack so we have the benefits of middlewares and the variety of web servers,
which support Rack (WEBrick, Thin, Puma, etc.) for free. Cuba is small (~170 lines of
code) what makes it faster compared with other frameworks.

Unlike other frameworks, Cuba is not opinionated software, it doesn't make
assumptions about what is the "best" way to do things. It's minimalist by
design which gives us the freedom to choose the proper tools for the job.

Prerequisites
-------------

This guide is designed for beginners who want to get started with a Cuba application
from scratch. However, you need to have some prerequisites installed:

* Ruby 2.0 or newer. You can get the latest Ruby distributions from the
  [Ruby download page](https://www.ruby-lang.org/en/downloads/).

* The [Redis][redis] database. If you haven't yet installed Redis, you can follow
  the instructions in the [Redis download page](http://redis.io/download).

By following along with this guide, we'll build a Twitter clone from scratch.
It's recommended to create a directory for the application code. Any reference
to create a new file or execute a specific command, will be made from that
directory. You can get the complete code [here][code].

Warming up
----------

You need to know that Cuba doesn't ship with all the tools that we need to
accomplish our goal, eg. a template rendering engine or a database client.
But this is where other libraries, that share the same minimalist philosophy,
come to the rescue.

To make it easier, let's install all the dependencies before we get started.
In order to achieve this, we will use the [dep][dep] gem. To install it,
open up a command line prompt and use the `gem install` command.

```
$ gem install dep
```

Dep is a tool to track dependencies in a project. That is very helpful if
you want to know which gems a project is using or if you want to share the
project with someone else and don't go insane installing all the dependencies
your project needs.

Open up your favorite text editor and save the following content as `.gems`.
This file serves as a manifest of the dependencies of our project.

```
cuba -v 3.1.0
cuba-contrib -v 3.1.0
ohm -v 2.0.0.rc1
```

Finally, execute the following command to install all the listed gems.

```
$ dep install
```

You will find the purpose behind each dependency over the course of this guide.
If you want to know more about the features provided by [dep][dep], please visit
the project [homepage](http://twpil.github.com/dep).

Creating the Cuba app
---------------------

Now that Cuba is correctly installed, it's time to create the classic hello world
application. Creating a Cuba application is pretty easy. Open your preferred text
editor and enter the following code:

```ruby
require "cuba"

Cuba.define do
  on root do
    res.write "Hello world!"
  end
end
```

Save this file as app.rb. As you can see, the code is very readable, but
don't worry, we will talk about the details later on.

You actually have a functional "Hello World" Cuba application already. To see it
working, you will need to start the web server. Before that, create a file called
`config.ru` with the contents shown in below:

```ruby
require "./app"

run Cuba
```

Now, we can start the web server. Rack comes with a tool called `rackup` to achieve
this task, but we will use [shotgun][shotgun] in this guide. You can install `shotgun`
with the `gem` command:

```
$ gem install shotgun
```

Unlike `rackup`, Shotgun will reload the application every time a new request comes
in from the web browser. That's great for development because we don't need to restart
the server every time that we make changes to the application. To shoot the server,
use the `shotgun` command.

```
$ shotgun
== Shotgun/WEBrick on http://127.0.0.1:9393/
[2014-02-20 13:20:26] INFO  WEBrick 1.3.1
[2014-02-20 13:20:26] INFO  ruby 2.1.0 (2013-12-25) [x86_64-darwin13.0]
[2014-02-20 13:20:26] INFO  WEBrick::HTTPServer#start: pid=24037 port=9393
```

This fired up WEBrick, a webserver built into Ruby by default. To see the app
in action, open a browser window and navigate to <http://localhost:9393/>. It
should show the "Hello world!" message.

**NOTE:** You will need to restart the server if you install or update a gem.

### Breaking Down the Syntax

Now that we know how to build a minimal Cuba application, let's take a deeper
look at the syntax:

```ruby
require "cuba"

Cuba.define do
  on root do
    res.write "Hello world!"
  end
end
```
n this short example, we can identify three methods that appear in all Cuba
applications: `define`, `on` and `res`.

As the name suggests, `Cuba#define` allows us to define a Cuba app through a block,
that gives us some objects like `req`, `res` and `env`, and a couple of helper
methods to manage the flow of our application, like the handy `on`.

`Cuba#on` is responsible for managing the control flow of our application and is the
cornerstone of defining routes. If you're used to the `if/else/case` statements, on
will be very easy to get. **How it works?** It executes the given block only if all
of the given arguments evaluate to `true`.

Going back to the above example, we can see that `on` expects `root` to be `true` in
order to write the "Hello, Cuba!" message. `root` returns `true` only if the accessed
path is the root of the application (`"/"` or `""`). That's why every time we enter
to <http://localhost:9393/>, we see the welcome message. It's possible to create
multiple `on` blocks or create nested ones, but we will discuss these features later.

Finally, there is the `res` object that not only represents the response object,
but also provides us with methods for setting the response status, the headers and
the body. This is a killer feature of Cuba, because we can explicitly handle the
server response.

Back to our example, we use the `write` method to set the response body with the
greeting message. By default, Cuba sets the response status code to `200`, but if
no routes match the request, it issues a `404`.

Setting the home page
---------------------

Now that we have a functional Cuba app, we need to display a page with a register
form for users not logged in to the app.

### The first template

Suppose you have to write a big chunk of HTML code or change a lot of pages at once,
it will be hard to do it if we define them inside the routes or using only strings.

```ruby
require "cuba"

Cuba.define do
  on root do
    res.write "<form> ... </form>"
  end
end
```

Templates promote reusability and maintainability.

Cuba doesn't ship with a template engine. This guide uses [mote][mote], a very
simple and fast template engine. We will use the [cuba-contrib][cuba-contrib] gem
to facilitate the integration between Mote and Cuba.

Open the `app.rb` file and add make these changes:

```ruby
require "cuba"
require "cuba/mote"

Cuba.plugin(Cuba::Mote)

Cuba.define do
  ...
end
```

Cuba provides a way to extend its functionality through the `plugin` method.
Later in the guide, we will demonstrate how to author your own plugins.

**NOTE:** If you want to use another template engine, read this
["Cuba and Tilt"](TODO).

Now that Mote is configured, let's create the layout. This is the HTML template
that wraps the main content of every template. Create a directory called `views`
and save the following content in a file called `layout.mote`.

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>Twitter Clone</title>
  </head>
  <body>
    {{ params[:content] }}
  </body>
</html>
```

There is one thing that you should notice `{{ params[:content] }}`. Mote prints in the
template whatever is between `{{` and `}}`. In this case, `{{ params[:content] }}`
is responsible for combining the content of each sub-page with the layout.

Now that we have a layout, let's create another template called `home.mote` with the
content below. Remember that all the templates need to be saved in the `views`
directory.

```html
<h2>New to Twitter?</h2>

<form action="/signup" method="POST">
  <input type="email" name="signup[email]" placeholder="Email">
  <input type="text" name="signup[username]" placeholder="Username">
  <input type="text" name="signup[name]" placeholder="Name">
  <input type="submit" value="Create Account">
</form>
```

The last step is to change the code inside the `root` route:

```ruby
require "cuba"
require "cuba/mote"

Cuba.plugin(Cuba::Mote)

Cuba.define do
  on root do
    render("home")
  end
end
```

The `render` method, provided by `Cuba::Mote`, will print the desired template
into the browser. Refresh your browser window. It should show the signup form.

### Passing Data into Templates

Let's add the ability to change the title of the page. First, we need to change
the `layout.mote` file and include the title head.

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>Twitter Clone | {{ params[:title] }}</title>
  </head>
  <body>
    {{ params[:content] }}
  </body>
</html>
```

Notice the `{{ params[:title] }}` statement. You can pass a hash as a second
parameter for the `render` method. This allows us to show information generated in
the back-end of the app to the front-end pages.

Change the `root` route on the `app.rb` file to set a title for the home page.

```ruby
...

Cuba.define do
  on root do
    render("home", title: "Welcome to Twitter")
  end
end
```

Refresh your browser window. It should show the new title.

This app wouldn't be a Twitter clone if it didn't have an authentication system.
But before thinking about users and passwords, we'll need to set a database to
store the users information. That's when Redis and Ohm come into play.

Setting up Redis and Ohm
------------------------

It'll be more difficult to create our own connection client or craft by hand the keys
to save the objects in Redis. That's why we'll use [Ohm][ohm], an Object-hash mapping
library for storing objects in Redis.

Setting up Ohm inside the app, is as easy as using a `require` statement:

```ruby
require "cuba"
require "cuba/mote"
require "ohm"

Cuba.plugin(Cuba::Mote)

Cuba.define do
  on root do
    render("home")
  end
end
```

By default, Ohm connects to `redis://127.0.0.1:6379`. If you want to change the
default, you can read the ["Connecting to a Redis Database"](https://github.com/soveran/ohm#connecting-to-a-redis-database)
section in the Ohm README.

To check if Ohm is set in our app, open `irb` (Interactive Ruby Shell) requiring
the app and execute the following command:

```
$ irb -r ./app.rb
>> Ohm.redis.call("ECHO", "Hello, Redis!")
=> "Hello, Redis!"
```

Creating the User model
-----------------------

Now that we have Redis and Ohm working, it's time to set the user model for the
authentication system. Ohm uses the `Ohm::Model` class to map objects to Redis
datastore.

Create a new directory called `models` and save the following content in a
file called `user.rb`:

```ruby
class User < Ohm::Model
end
```

That's it! We don't need migrations or schema definitions to start using it.
For the moment, we need to save the username, email and name of the users. We can
use the `attribute` class method to define the attributes to be saved. The values
will be stored as strings.

```ruby
class User < Ohm::Model
  attribute :username
  attribute :email
  attribute :name
end
```

Add this line to the `app.rb` file to require all the models inside the `/models`
directory.

```ruby
require "cuba"
require "cuba/mote"
require "ohm"

Cuba.plugin(Cuba::Mote)

Dir["./models/**/*.rb"].each { |f| require(f) }

...
```

Let's play around with Ohm!

```
$ irb -r ./app.rb
>> user = User.create(username: "john", name: "John Doe", email: "john@doe.com")
>> user.id
# => 2
>> user.attributes
# => {:username=>"john", :name=>"John Doe", :email=>"john@doe.com"}
>> user == User[2]
# => true
```

User signup form
----------------

We already have a signup form in the homepage, but if you click the "Create Account"
button nothing happens. Before touching the code, let's think about what we need.

1. We need to match the "/signup" path.
2. Also, it's important to check that HTTP POST method is used.
3. Finally, check if the "signup" request parameter is present.

Guess what? Cuba provides all the features to accomplish those tasks in an elegant
way. Let's add the piece of code that is missing:

```ruby
require "cuba"
require "cuba/mote"
require "ohm"

Cuba.plugin(Cuba::Mote)

Dir["./models/**/*.rb"].each { |f| require(f) }

Cuba.define do
  on root do
    render("home", title: "Welcome to Twitter")
  end

  on "signup" do
    on post, param("signup") do |signup|
      user = User.create(signup)

      res.write("You created a new user: #{user.id}")
    end
  end
end
```

Adding some validation
----------------------

[code]: https://github.com/frodsan/cuba-guide/tree/master/twitter-clone
[cuba]: https://github.com/soveran/cuba
[cuba-contrib]: https://github.com/cyx/cuba-contrib
[dep]: https://github.com/cyx/dep
[mote]: https://github.com/soveran/mote
[ohm]: https://github.com/soveran/ohm
[redis]: http://redis.io/
[shotgun]: https://github.com/rtomayko/shotgun
[soveran]: https://github.com/soveran/
