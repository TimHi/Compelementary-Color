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

  { 0 => "00", 1 => "11", 2 => "22", 3 => "33", 4 => "44", 5 => "55", 6 => "66",
    7 => "77", 8 => "88", 9 => "99", 10 => "aa",
    11 => "bb", 12 => "cc", 13 => "dd", 14 => "ee", 15 => "ff", 17 => "11" }.each do |digit, expected|
    define_method("test_#{digit}_convert_decimal_to_2_digit_hex") do
      assert_equal(expected, ::RGB.convert_decimal_to_2_digit_hex(digit))
    end
  end

  { "00" => 0, "01" => 1, "02" => 2, "03" => 3, "04" => 4, "05" => 5, "06" => 6, "07" => 7,
    "08" => 8, "09" => 9, "0a" => 10, "0b" => 11, "0c" => 12, "0d" => 13, "0e" => 14,
    "0f" => 15, "ff" => 255, "00000000" => 0 }.each do |hex_value, expected|
    define_method("test_#{hex_value}_hex_to_dec") do
      assert_equal(expected, ::RGB.hex_to_dec(hex_value))
    end
  end
end
