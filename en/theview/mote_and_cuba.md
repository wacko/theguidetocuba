Mote & Cuba
===========

To use Mote into Cuba applications, we will use the
[cuba-contrib](https://github.com/cyx/cuba-contrib/) gem. This gem
contains a series of useful extensions for Cuba.

To integrate Mote into a Cuba application, we need to do two steps.
First, require the `cuba/mote` file and then load the `Cuba::Mote`
extension. If we look closely, this is already done in the `app.rb`
file:

```ruby
require "cuba"
require "cuba/mote"

...

Cuba.plugin(Cuba::Mote)
```
