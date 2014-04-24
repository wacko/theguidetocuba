Hello Cuba!
===========

Now that the dependencies of our project are correctly installed, it's
time to see how Cuba works.

time to create the classic **Hello World!** application.

1 .- Parte 1

```ruby
require "cuba"
require "cuba/mote"
require "ohm"
require "rack/protection"
require "shield"
require "scrivener"
```

2 .- Parte 2

```ruby
APP_KEY = ENV.fetch("APP_KEY")
APP_SECRET = ENV.fetch("APP_SECRET")
REDIS_URL = ENV.fetch("REDIS_URL")
```

3.- Parte 3

```ruby
Cuba.plugin(Cuba::Mote)
Cuba.plugin(Shield::Helpers)
# ...
# ...
Ohm.redis = Redic.new(REDIS_URL)
```

4 .- Parte 4.

```
Dir["./models/**/*.rb"].each  { |f| require(f) }
Dir["./filters/**/*.rb"].each { |f| require(f) }
Dir["./helpers/**/*.rb"].each { |f| require(f) }
Dir["./routes/**/*.rb"].each  { |f| require(f) }
```

5 .- Parte 5.

```ruby
```

Creating a Cuba application is pretty easy. Open your text editor and
enter the code in [Example 1-3](#example13).

```ruby
Cuba.define do
  on root do
    res.write "Hello world!"
  end
end
```
As you can see, the code is very readable. We will talk about the details later on.

You actually have a functional "Hello World" Cuba application already.
To see it working, you will need to start a web server. Next chapter.
