# frozen_string_literal: true

require "test_helper"

class TestColoR < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::ColoR::VERSION
  end

  # Test to verify an input hex color returns the correct complementary color
  # Arrange: Get Color from list
  # Act: Pass color to ColoR.get_complementary_color
  # Assert: Verify the input color matches the expected color
  { "#abc" => "#554433", "#ABC" => "#554433", "#000" => "#ffffff", "#ff0000" => "#00ffff", "#00ff00" => "#ff00ff",
    "#0000ff" => "#ffff00", "#ffffff" => "#000000" }.each do |comp_color_input, expected|
    define_method("test_get_complementary_#{comp_color_input}") do
      assert_equal(expected, ::ColoR.get_complementary_color(comp_color_input))
    end
  end

  # Test wether the get monochromatic color method returns the correct color.
  # Arrange: Get colors from the input
  # Act: Call get_monochromatic_color
  # Assert: Verify it is the expected color
  { "#abc" => "#7192b3", "#ABC" => "#7192b3", "#000" => "#1a1414", "#ff0000" => "#e62e2e", "#00ff00" => "#2ee62e",
    "#0000ff" => "#2e2ee6", "#ffffff" => "#e6b8b8", "#b833ad" => "#9f4c98",
    "#9eb336" => "#839a10" }.each do |color_input, expected|
    define_method("test_get_single_monochromatic_#{color_input}") do
      assert_equal(expected, ::ColoR.get_monochromatic_color(color_input))
    end
  end

  # Test wether the hex to hsv method does the correct conversion.
  # Arrange: Get colors from the input
  # Act: Call hex_to_hsv
  # Assert: Verify it is the expected conversion
  { "#ff7f7f" => [0, 0.502, 1.0], "#ffbf7f" => [30, 0.502, 1.0], "#ff7fbf" => [330, 0.502, 1.0],
    "#ff0900" => [2, 1.0, 1.0], "#ff8800" => [32, 1.0, 1.0], "#ff0077" => [332, 1.0, 1.0],
    "#ccbea3" => [40, 0.201, 0.8], "#c5cca3" => [70, 0.201, 0.8],
    "#ccaaa3" => [10, 0.201, 0.8] }.each do |color_input, expected|
    define_method("test_hex_to_hsv_#{color_input}") do
      assert_equal(expected, ::ColoR.hex_to_hsv(color_input))
    end
  end

  # Test wether the get analogous color method returns the correct color.
  # Arrange: Get colors from the input
  # Act: Call get_analogous_scheme
  # Assert: Verify it is the expected colors
  { "#ff7f7f" => ["#ff9f7f", "#ff7fbf"], "#ccbea3" => ["#ccc9a3", "#ccaaa3"] }.each do |color_input, expected|
    define_method("test_get_analogous_scheme_#{color_input}") do
      assert_same_elements(expected, ::ColoR.get_analogous_scheme(color_input))
    end
  end

  # Test to verify invalid string inputs are detected and handled with an custom HexCodeError
  # Arrange: Get value from list
  # Act: Call ColoR.get_complementary_color
  # Assert: Verify the error was raised with the correct error message
  ["AAL", "", "#aa", "#aaaaaaa", "0"].each do |wrong_value|
    define_method("test_get_complementary_invalid#{wrong_value}") do
      assert_raises(HexCodeError, wrong_value) { ::ColoR.get_complementary_color(wrong_value) }
    end
  end

  [0, 1, 100, -1, 0.1].each do |wrong_value|
    define_method("test_get_complementary_invalid_digit#{wrong_value}") do
      assert_raises(HexCodeError, wrong_value) { ::ColoR.get_complementary_color(wrong_value) }
    end
  end
end
