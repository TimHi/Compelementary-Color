# frozen_string_literal: true

# Offering functionality related to the hex color model.
module Hex
  # Hex Colors can be represented with three characters, to work
  def self.fill_hex_color(short_hex_color)
    long_hex_color = "#".dup
    short_hex_color.each_char { |c| long_hex_color << (c * 2) unless c == "#" }
    long_hex_color.downcase
  end

  # Test wether a given color is a valid hex color.
  def self.hex?(color_to_test)
    if color_to_test.is_a? String
      color_to_test.match("^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$")
    else
      false
    end
  end
end
