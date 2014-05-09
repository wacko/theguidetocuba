Loading the Application
=======================

In this section, we'll see how the *app.rb* file initializes the
application. This file is important in the boot process because
it defines everything the application needs to run. We'll walk
step by step through this file so you understand everything that
happens under the hood.

First, we require the gems we're going to use along this project.

```ruby
require "cuba"
require "cuba/mote"
...
require "scrivener"
```

Then we define some constants that are used to connect to a database or to
check cookie data integrity.

```ruby
APP_KEY = ENV.fetch("APP_KEY")
APP_SECRET = ENV.fetch("APP_SECRET")
REDIS_URL = ENV.fetch("REDIS_URL")
```

Because these are sensitive configurations, we use environment variables
instead of putting them directly into the code. To set these values into
our environment, we load them from the *env.sh* file when starting the
server. To read them, we use the Ruby `ENV` accessor.

The next part is where we connect Cuba with its friends. We'll have a
closer look later.

```ruby
Ohm.redis = Redic.new(REDIS_URL)

Cuba.plugin(Cuba::Mote)
Cuba.plugin(Shield::Helpers)

...

Cuba.use(Rack::Protection)
Cuba.use(Rack::Protection::RemoteReferrer)
```

Next, we require the content of the subfolders where we find the core code
of our application. This includes models, filter objects, helpers, etc.

```ruby
Dir["./models/**/*.rb"].each  { |f| require(f) }
Dir["./filters/**/*.rb"].each { |f| require(f) }
Dir["./helpers/**/*.rb"].each { |f| require(f) }
Dir["./routes/**/*.rb"].each  { |f| require(f) }
```

You should recognize the last part:

```ruby
Cuba.define do
  on root do
    render("home")
  end
end
```

It's almost the same as in our first application, but with one significant
difference: the `render` method. In the next chapter, we'll explain this
method and see how it can be used to render view templates.
