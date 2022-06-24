# frozen_string_literal: true

require "color/hex"

# Offering functionality related to the RGB color model.
module RGB
  def self.hex_to_rgb(hex_color)
    hex_color = Hex.fill_hex_color(hex_color) if hex_color.length == 4 # Length 4 => #aac
    [(hex_color[1].to_i(16) * 16) + hex_color[2].to_i(16),
     (hex_color[3].to_i(16) * 16) + hex_color[4].to_i(16),
     (hex_color[5].to_i(16) * 16) + hex_color[6].to_i(16)]
  end

  def self.rgb_to_hex(rgb_color)
    "#".dup << convert_decimal_to_2_digit_hex(rgb_color[0]) << convert_decimal_to_2_digit_hex(rgb_color[1]) << convert_decimal_to_2_digit_hex(rgb_color[2])
  end

  def self.convert_decimal_to_2_digit_hex(dec)
    hex = dec.to_s(16)
    hex *= 2 if hex.length == 1
    hex
  end
end
