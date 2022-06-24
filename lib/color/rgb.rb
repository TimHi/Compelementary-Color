# frozen_string_literal: true

require "color/hex"

# Offering functionality related to the RGB color model.
module RGB
  def self.hex_to_rgb(hex_color)
    if hex_color.length == 4 # Length 4 => #aac
      hex_color = Hex.fill_hex_color(hex_color)
      puts hex_color
    end
    [0, 0, 0]
  end
end
