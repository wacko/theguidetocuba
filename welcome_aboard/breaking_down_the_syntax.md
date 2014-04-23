Breaking Down the Syntax
========================

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

In this short example, we can identify three methods that appear in
all Cuba applications: `define`, `on` and `res`.

As the name suggests, `Cuba#define` allows us to define a Cuba app
through a block, that gives us some objects like `req`, `res` and
`env`, and a couple of helper methods to manage the flow of our
application, like the handy `on`.

`Cuba#on` is responsible for managing the control flow of our
application and is the cornerstone of defining routes. If you're
used to the `if/else/case` statements, on will be very easy to get.
**How it works?** It executes the given block only if all of the given
arguments evaluate to `true`.

Going back to the above example, we can see that `on` expects `root` to
be `true` in order to write the "Hello, Cuba!" message. `root` returns
`true` only if the accessed path is the root of the application (`"/"` or
`""`). That's why every time we enter to <http://localhost:9393/>, we see
the welcome message. It's possible to create multiple `on` blocks or create
nested ones, but we will discuss these features later.

Finally, there is the `res` object that not only represents the response
object, but also provides us with methods for setting the response status,
the headers and the body. This is a killer feature of Cuba, because we can
explicitly handle the server response.

Back to our example, we use the `write` method to set the response body
with the greeting message. By default, Cuba sets the response status code
to `200`, but if no routes match the request, it issues a `404`.
