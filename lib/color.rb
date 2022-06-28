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

  def self.get_monochromatic_color(color)
    raise HexCodeError.new("Not a valid Hex Color"), color unless ::Hex.hex?(color)

    rgb_color = ::RGB.hex_to_rgb(color)
    hue_color = ::HSV.rgb_to_hsv(rgb_color)
    mono_color = ::HSV.calculate_monochromatic_color(hue_color)
    mono_rgb = ::HSV.hsv_to_rgb(mono_color[0], mono_color[1], mono_color[2])
    puts mono_rgb
    ::RGB.rgb_to_hex(mono_rgb)
  end
end
