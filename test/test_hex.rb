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
      assert(::Hex.hex?(actual))
    end
  end

  # Test wether a given valid Hexcode is recognized as a color.
  # Arrange: Get the code from the array
  # Act: Call hex?
  # Assert: Verify the color is recognized correctly
  %w[#abc #ABC #000 #FFF #000000 #FF0000 #00FF00 #0000FF #FFFFFF].each do |valid_hex_code|
    define_method("test_#{valid_hex_code}_is_valid_hex_code") do
      assert(::Hex.hex?(valid_hex_code))
    end

    # Test wether a given invalid Hexcode is recognized as such.
    # Arrange: Get the code from the array
    # Act: Call hex?
    # Assert: Verify the color is recognized correctly as a invalid hex code.
    %w[#ab #AAasdC #18000 # 000000 #F0000 #00!F? #0000FF! #FFFkFFF #OPA].each do |invalid_hex_code|
      define_method("test_#{invalid_hex_code}_is_valid_hex_code") do
        assert(!::Hex.hex?(invalid_hex_code))
      end
    end
  end
end
