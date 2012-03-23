require './lib/rcss.rb'

c = RCSS::Class.new( "body" )

c.add_content "color", "black"

p = RCSS::Parser.new( c )
p.parse

