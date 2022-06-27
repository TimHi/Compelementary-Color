# frozen_string_literal: true

# Offering functionality related to the HSV color model.
module HSV
  # Hex Colors can be represented with three characters, to work
  def self.rgb_to_hsv(rgb_color)
    max = rgb_color.max()
    min = rgb_color.min()
    value = (max.to_f / 255).round(3)
    saturation = 0
    min_max_diff = max - min
    saturation = ((max - min).to_f / max).round(3) if value.positive?

    if rgb_color[0] > rgb_color[1] && rgb_color[0] > rgb_color[2]
      hue = 60 * ((rgb_color[2] - rgb_color[1]).to_f / min_max_diff).round(3)
    elsif rgb_color[2] > rgb_color[0] && rgb_color[2] > rgb_color[1]
      hue = 60 * ((2 + (rgb_color[2] - rgb_color[0])).to_f / min_max_diff).round(3)
    elsif rgb_color[1] > rgb_color[0] && rgb_color[1] > rgb_color[2]
      hue = 60 * ((4 + (rgb_color[0] - rgb_color[1])).to_f / min_max_diff).round(3)
    else
      hue = 0
    end
    hue += 360 if hue.negative?
    [hue, saturation, value]
  end
end
