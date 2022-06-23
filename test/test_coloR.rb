# frozen_string_literal: true

require "test_helper"

class TestColoR < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::ColoR::VERSION
  end

  # Test wether a given valid Hexcode is recognized as a color.
  # Arrange: Get the code from the array
  # Act: Call hex?
  # Assert: Verify the color is recognized correctly
  %w[#abc #ABC #000 #FFF #000000 #FF0000 #00FF00 #0000FF #FFFFFF].each do |valid_hex_code|
    define_method("test_#{valid_hex_code}_is_valid_hex_code") do
      assert(::ColoR.hex?(valid_hex_code))
    end

    # Test wether a given invalid Hexcode is recognized as such.
    # Arrange: Get the code from the array
    # Act: Call hex?
    # Assert: Verify the color is recognized correctly as a invalid hex code.
    %w[#ab #AAasdC #18000 # 000000 #F0000 #00!F? #0000FF! #FFFkFFF #OPA].each do |invalid_hex_code|
      define_method("test_#{invalid_hex_code}_is_valid_hex_code") do
        assert(!::ColoR.hex?(invalid_hex_code))
      end
    end
  end
end
