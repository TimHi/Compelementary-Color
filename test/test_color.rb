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
  { "#abc" => "#7192b3", "#ABC" => "#7192b3", "#000" => "#1a1515", "#ff0000" => "#e62e2e", "#00ff00" => "#2ee62e",
    "#0000ff" => "#2e2ee6", "#ffffff" => "#e6b8b8" }.each do |color_input, expected|
    define_method("test_get_single_monochromatic_#{color_input}") do
      assert_equal(expected, ::ColoR.get_monochromatic_color(color_input))
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
