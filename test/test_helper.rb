# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "color"
require "color/rgb"
require "color/hex"
require "color/hsv"

require "minitest/autorun"

require "simplecov"
SimpleCov.start
