# frozen_string_literal: true

require "test_helper"

class TestHHSV < Minitest::Test
  { [1, 0, 0] => [0, 1, 0.004], [0, 0, 1] => [240, 1, 0.004], [0, 1, 0] => [120, 1, 0.004], [0, 0, 0] => [0, 0, 0],
    [25, 25, 25] => [0, 0, 0.098], [125, 50, 25] => [15, 0.8, 0.49] }.each do |rgb_color, expected_hsv_color|
    define_method("test_#{rgb_color}_rgb_to_hsv") do
      assert_equal(expected_hsv_color, ::HSV.rgb_to_hsv(rgb_color))
    end
  end
end
