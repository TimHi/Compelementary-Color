# frozen_string_literal: true

require_relative "color/version"
require "color/error/hex_code_error"

# Offering functionality to get the complementary colors of a given input.
module ColoR
  class Error < StandardError; end

  def self.get_complementary_color(hex_color)
    raise HexCodeError.new("Not a valid Hex Color"), hex_color unless ::Hex.hex?(hex_color)

    rgb_color = ::RGB.hex_to_rgb(hex_color)
    comp_r = [255 - rgb_color[0], 255 - rgb_color[1], 255 - rgb_color[2]]
    ::RGB.rgb_to_hex(comp_r)
  end

  def self.get_monochromatic_color(hex_color)
    raise HexCodeError.new("Not a valid Hex Color"), color unless ::Hex.hex?(hex_color)

    hue_color = hex_to_hsv(hex_color)
    mono_color = ::HSV.calculate_monochromatic_color(hue_color)
    mono_rgb = ::HSV.hsv_to_rgb(mono_color[0], mono_color[1], mono_color[2])
    ::RGB.rgb_to_hex(mono_rgb)
  end

  def self.get_analogous_scheme(hex_color)
    raise HexCodeError.new("Not a valid Hex Color"), hex_color unless ::Hex.hex?(hex_color)

    hsv_color = hex_to_hsv(hex_color)
    analogous_colors = []
    analogous_colors.push(hsv_to_hex(HSV.add_hue_to_hsv(15, [hsv_color[0], hsv_color[1], hsv_color[2]])))
    analogous_colors.push(hsv_to_hex(HSV.add_hue_to_hsv(330, [hsv_color[0], hsv_color[1], hsv_color[2]])))
    analogous_colors
  end

  def self.hex_to_hsv(hex_color)
    rgb_color = ::RGB.hex_to_rgb(hex_color)
    ::HSV.rgb_to_hsv(rgb_color)
  end

  def self.hsv_to_hex(hsv_color)
    rgb_color = ::HSV.hsv_to_rgb(hsv_color[0], hsv_color[1], hsv_color[2])
    ::RGB.rgb_to_hex(rgb_color)
  end
end
