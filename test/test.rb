require './lib/rcss.rb'
require './lib/rcss/core.rb'
require './lib/rcss/css.rb'

c = RCSS::Core::Class.new( "body" )

c.add_content "color", "black"

p = RCSS::Core::Parser.new( c )
p.parse

