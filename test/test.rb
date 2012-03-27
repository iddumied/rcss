require './lib/rcss.rb'

c = RCSS::Core::Class.new( "body" )

c.add_content "color", "black"

p = RCSS::Core::Parser.new( c )
p.parse

