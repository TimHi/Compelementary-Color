# frozen_string_literal: true

# Offering functionality related to the HSV color model.
module HSV
  HUE_MULTIPLIER = 60
  RGB_MAX_VALUE = 255
  ROUND_VALUE = 3
  FULL_CIRCLE_DEG = 360
  MONO_SATURATION = 0.15
  MONO_VALUE = 0.05
  # Hex Colors can be represented with three characters, to work
  def self.rgb_to_hsv(rgb_color)
    max = rgb_color.max()
    min = rgb_color.min()
    r = rgb_color[0]
    g = rgb_color[1]
    b = rgb_color[2]

    value = (max.to_f / RGB_MAX_VALUE).round(ROUND_VALUE)
    max_min_diff = max - min
    hue = calculate_hue(r, g, b, max_min_diff)
    hue += FULL_CIRCLE_DEG if hue.negative?
    [hue, calculate_saturation(max_min_diff, max, value), value]
  end

  def self.calculate_saturation(max_min_diff, max, value)
    saturation = 0
    saturation = (max_min_diff.to_f / max).round(ROUND_VALUE) if value.positive?
    saturation
  end

  # Method to calculate the hue value of three given rgb colors and the difference
  # of the max - min color.
  def self.calculate_hue(red, green, blue, max_min_diff)
    if red > green && red > blue
      HUE_MULTIPLIER * calculate_raw_hue_value(0, green, blue, max_min_diff)
    elsif green > red && green > blue
      HUE_MULTIPLIER * calculate_raw_hue_value(2, blue, red, max_min_diff)
    elsif blue > red && blue > green
      HUE_MULTIPLIER * calculate_raw_hue_value(4, red, green, max_min_diff)
    else
      0
    end
  end

  def self.calculate_raw_hue_value(offset, first_color, second_color, max_min_diff)
    (offset + (first_color - second_color).to_f) / max_min_diff.round(ROUND_VALUE)
  end

  # Calculate the a monochromatic value to a given color
  def self.calculate_monochromatic_color(hue_color)
    saturation = hue_color[1]
    value = hue_color[2]
    saturation -= MONO_SATURATION
    value -= MONO_VLUE
    [hue_color[0], saturation, value]
  end
end
