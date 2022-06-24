# frozen_string_literal: true

# Offering functionality related to the hex color model.
module Hex
  # Hex Colors can be represented with three characters, to work
  def self.fill_hex_color(short_hex_color)
    long_hex_color = "#".dup
    short_hex_color.each_char { |c| long_hex_color << (c * 2) unless c == "#" }
    long_hex_color.downcase
  end
end
