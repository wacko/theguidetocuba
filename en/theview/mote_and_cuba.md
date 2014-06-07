Mote & Cuba
===========

To use Mote in our application, we have to require the `cuba/mote` file
and include the `Cuba::Mote` plugin that comes with it. If we look closely,
this has already been done in the `app.rb` file:

```ruby
require "cuba"
require "cuba/mote"

...

Cuba.plugin(Cuba::Mote)
```

The `Cuba::Mote` plugin is one of the useful extensions provided by the
[cuba-contrib](https://github.com/cyx/cuba-contrib/) gem, one of the gems
we installed in the section [Managing Dependencies](/en/setting_the_road/managing_dependencies.html).
