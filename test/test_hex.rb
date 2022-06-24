# frozen_string_literal: true

require "test_helper"

class TestHex < Minitest::Test
  # Test to verify that 4 digit hex codes are filled correctly.
  # #aac => #aaaacc
  # Arrange: Get three digit hex color from input
  # Act: Fill three digit hex color to be a six color one.
  # Assert: Verify it is the expected color and is a valid hex color.
  { "#abc" => "#aabbcc", "#ABC" => "#aabbcc", "#000" => "#000000", "#FF0" => "#ffff00" }.each do |color_input, expected|
    define_method("test_#{color_input}_fill_hex") do
      actual = ::Hex.fill_hex_color(color_input)
      assert_equal(expected, actual)
      assert(::ColoR.hex?(actual))
    end
  end
end
