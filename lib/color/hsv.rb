# frozen_string_literal: true

# Offering functionality related to the HSV color model.
module HSV
  # Hex Colors can be represented with three characters, to work
  def self.rgb_to_hsv(rgb_color)
    max = rgb_color.max()
    min = rgb_color.min()
    r = rgb_color[0]
    g = rgb_color[1]
    b = rgb_color[2]

    value = (max.to_f / 255).round(3)
    saturation = 0
    min_max_diff = max - min
    saturation = ((max - min).to_f / max).round(3) if value.positive?

    if r > g && r > b
      hue = 60 * ((g - b).to_f / min_max_diff).round(3)
    elsif g > r && g > b
      hue = 60 * ((2 + (b - r)).to_f / min_max_diff).round(3)
    elsif b > r && b > g
      hue = 60 * ((4 + (r - g)).to_f / min_max_diff).round(3)
    else
      hue = 0
    end

    hue += 360 if hue.negative?
    [hue, saturation, value]
  end
end
