Breaking Down the Syntax
========================

Now that we know how to build a minimal Cuba application, let's take a deeper
look at the syntax. We can split this example into three parts:

First, we require Cuba to load the gem and get access to
its functionality.

```ruby
require "cuba"
```

Then we can identify four methods that appear in most Cuba
applications: `define`, `on`, `root` and `res`.

```ruby
Cuba.define do
  on root do
    res.write("Hello, Cuba!")
  end
end
```

* `define` allows us to create an application through a block.

* `on` executes a given block if the passed conditions evaluate to `true`.

* `root` returns `true` if the accessed path is the root of the
  application (`"/"` or `""`).

* `res` handles the server response. In this case, we use the `write`
  method to set the response body with the greeting message.

Finally, the last line connects our application with Rack.

```ruby
run(Cuba)
```

Don't worry if you don't understand what Rack is just yet, we'll discuss
it in the next section.
