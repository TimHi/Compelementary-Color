# frozen_string_literal: true

require_relative "color/version"
require "color/error/hex_code_error"

# Offering functionality to get the complementary colors of a given input.
module ColoR
  class Error < StandardError; end

  def self.get_complementary_color(color)
    raise HexCodeError.new("Not a valid Hex Color"), color unless ::Hex.hex?(color)

    rgb_color = ::RGB.hex_to_rgb(color)
    comp_r = [255 - rgb_color[0], 255 - rgb_color[1], 255 - rgb_color[2]]
    ::RGB.rgb_to_hex(comp_r)
  end
end
