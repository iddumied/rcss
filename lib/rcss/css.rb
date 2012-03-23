module RCSS

  class CSS

    attr_reader :classes

    def initialize( output = $stdout )
      @classes = Array.new
    end

    def add_class( name )
      if name.is_a? String or name.is_a? Symbol
        @classes << RCSS::Core::Class.new name.to_s
      else raise "Name is not a String or Symbol"
      end
    end

    def get_class name
      @classes.each { |c| return c if c.name == name }
      false
    end

  end

end
