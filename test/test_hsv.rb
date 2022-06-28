# frozen_string_literal: true

require "test_helper"

class TestHHSV < Minitest::Test
  { [1, 0, 0] => [0, 1, 0.004], [0, 0, 1] => [240, 1, 0.004], [0, 1, 0] => [120, 1, 0.004], [0, 0, 0] => [0, 0, 0],
    [25, 25, 25] => [0, 0, 0.098], [125, 50, 25] => [15, 0.8, 0.49] }.each do |rgb_color, expected_hsv_color|
    define_method("test_#{rgb_color}_rgb_to_hsv") do
      assert_equal(expected_hsv_color, ::HSV.rgb_to_hsv(rgb_color))
    end
  end

  { [0, 0, 0] => [0, 0, 0], [10, 1, 0.25] => [64, 11, 0], [0, 0.800000, 0.25] => [64, 13, 13],
    [30, 0, 0.25] => [64, 64, 64], [30, 0.01, 0.25] => [64, 63, 63] }.each do |hsv_color, expected_rgb_color|
    define_method("test_#{hsv_color}_hsv_to_rgb") do
      assert_equal(expected_rgb_color, ::HSV.hsv_to_rgb(hsv_color[0], hsv_color[1], hsv_color[2]))
    end
  end
end
