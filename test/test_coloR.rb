# frozen_string_literal: true

require "test_helper"

class TestColoR < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::ColoR::VERSION
  end

  def test_get_complementary_color
    ::ColoR.get_complementary_color("#eb4034")
  end
end
