# frozen_string_literal: true

require_relative "color/version"

# Offering functionality to get the complementary colors of a given input.
module ColoR
  class Error < StandardError; end

  # Error class to capture illegal hex codes being passed to the class.
  class HexCodeError < StandardError
    attr_reader :wrong_color

    def initialize(wrong_color)
      super
      @wrong_color = wrong_color
    end
  end
  # Your code goes here...

  def self.get_complementary_color(color)
    raise HexCodeError.new("Not a valid Hex Color"), color unless hex?(color)

    puts "Valid Hex Color"
  end

  def self.hex?(color)
    color.match("^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$")
  end
end
