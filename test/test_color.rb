# frozen_string_literal: true

require "test_helper"

class TestColoR < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::ColoR::VERSION
  end

  { "#abc" => "#554433", "#ABC" => "#554433", "#000" => "#ffffff", "#ff0000" => "#00ffff", "#00ff00" => "#ff00ff",
    "#0000ff" => "#ffff00", "#ffffff" => "#000000" }.each do |comp_color_input, expected|
    define_method("test_get_complementary_#{comp_color_input}") do
      assert_equal(expected, ::ColoR.get_complementary_color(comp_color_input))
    end
  end
end
