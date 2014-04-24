Hello Cuba!
===========

Now that Cuba is correctly installed, it's time to create the classic Hello World
application. Creating a Cuba application is pretty easy. Open your text editor and
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
