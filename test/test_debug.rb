# frozen_string_literal: true

require "test_helper"

class TestColoR < Minitest::Test
  def test_anal
    assert_same_elements(["#ff9f7f", "#ff7fbf"], ::ColoR.get_analogous_scheme("#ff7f7f"))
  end
end


