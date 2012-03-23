module RCSS::Core

  class Class

    attr_reader :name, :content

    def initialize( name )
      @name = name
      @content = Array.new
    end

    def add( *content )
      content.each { |c| add_content c }
    end

    def add_content c, value = nil
      if c.is_a? RCSS::Content
        @content << c

      elsif c.is_a? String or c.is_a? Symbol
        raise "val #{value} is not a String" unless value.is_a? String
        @content << Content.new( c.to_s, value )

      else
        raise "Can not add #{c}:#{c.class} and #{value}:#{value.class}"

      end
    end

  end

  class Content
    attr_reader :identifier, :value
    def initialize( identifier, value )
      @identifier, @value = identifier, value
    end
  end

  class Indention

    def initialize( i=0 )
      @val = i
    end

    def inc
      @val += 1
    end

    def dec
      @val -= 1
    end

    def to_s
      out = String.new
      @val.times { out += "\t" }
      out
    end
  end

  class Parser

    def initialize( classes, puts = $stdputs )
      classes = [ classes ] unless classes.is_a? Array
      @classes = classes 
      @indention = Indention.new
    end

    def parse
      @classes.each do |c|
        puts ".#{c.name} {"
        @indention.inc
        c.content.each { |cont| puts "#{@indention}#{cont.identifier}: #{cont.value};" }
        @indention.dec
        puts "}"
      end
    end

  end

end
