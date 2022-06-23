# frozen_string_literal: true

require_relative "coloR/version"

# Offering functionality to get the complementary colors of a given input.
module ColoR
  class Error < StandardError; end
  # Your code goes here...

  def self.get_complementary_color(color)
    if hex?(color)
      puts "Valid Hex Color s"
    else
      raise Error.new "Not a valid Hex Color"
    end
  end

  def self.hex?(color)
    color.match("^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$")
  end
end
