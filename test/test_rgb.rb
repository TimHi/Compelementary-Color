# frozen_string_literal: true

require "test_helper"

class TestRGB < Minitest::Test
  { "#abc" => [170, 187, 204], "#ABC" => [170, 187, 204], "#000" => [0, 0, 0], "#FF0000" => [255, 0, 0],
    "#00FF00" => [0, 255, 0], "#0000FF" => [0, 0, 255],
    "#FFFFFF" => [255, 255, 255] }.each do |color_input, expected|
    define_method("test_#{color_input}_convert_to_rgb") do
      assert_equal(expected, ::RGB.hex_to_rgb(color_input))
    end
  end
  { [170, 187, 204] => "#aabbcc", [0, 0, 0] => "#000000", [255, 0, 0] => "#ff0000",
    [0, 255, 0] => "#00ff00", [0, 0, 255] => "#0000ff",
    [255, 255, 255] => "#ffffff" }.each do |color_input, expected|
    define_method("test_#{color_input}_convert_to_hex") do
      assert_equal(expected, ::RGB.rgb_to_hex(color_input))
    end
  end
end
