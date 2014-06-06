Mote & Cuba
===========

To use Mote in our Cuba application, we'll use the
[cuba-contrib](https://github.com/cyx/cuba-contrib/) gem. This gem
contains a series of useful extensions for Cuba.

To make use of it you have to require the `cuba/mote` file and load 
the `Cuba::Mote` extension. If we look closely, this has already 
been done in the `app.rb` file:

```ruby
require "cuba"
require "cuba/mote"

...

Cuba.plugin(Cuba::Mote)
```
