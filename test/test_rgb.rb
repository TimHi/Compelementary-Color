# frozen_string_literal: true

require "test_helper"

class TestRGB < Minitest::Test
  { "#abc" => "#ccb7aa", "#ABC" => "#ccb7aa", "#000" => "#000000", "#FF0000" => "#00ff00", "#00FF00" => "#ff0000",
    "#0000FF" => "#ff8000", "#FFFFFF" => "#ffffff" }.each do |color_input, expected|
    define_method("test_#{color_input}_convert_to_rgb") do
      assert_equal(::RGB.hex_to_rgb(color_input), expected)
    end
  end
end
