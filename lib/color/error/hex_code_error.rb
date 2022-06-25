# frozen_string_literal: true

# Error class to capture illegal hex codes being passed to the class.
class HexCodeError < StandardError
  attr_reader :wrong_color

  def initialize(wrong_color)
    super
    @wrong_color = wrong_color
  end
end
