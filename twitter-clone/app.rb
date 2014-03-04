require "cuba"
require "cuba/mote"
require "ohm"

Cuba.plugin(Cuba::Mote)

Dir["./models/**/*.rb"].each { |f| require(f) }

Cuba.define do
  on root do
    render("home", title: "Welcome to Twitter")
  end
end
