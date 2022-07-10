# ColoR

[![Gem Version](https://badge.fury.io/rb/Complementary_Color.svg)](https://badge.fury.io/rb/Complementary_Color)
[![Test + Lint](https://github.com/TimHi/Compelementary-Color/actions/workflows/main.yml/badge.svg)](https://github.com/TimHi/Compelementary-Color/actions/workflows/main.yml)

ColoR's main aspect is the creation of aesthetic pleasing color schemes. Also offers various conversions between the color models.

## Installation

Install the gem and add to the application's Gemfile by executing:

    > bundle add coloR

If bundler is not being used to manage dependencies, install the gem by executing:

    > gem install coloR

## Usage

Implemented are three options:

### Get Complementary color  

Call `::Color.get_complementary_color(hex_color)` to retrieve the complementary color.  

### Get monochromatic color  

Call `::Color.get_monochromatic_color(hex_color)` to retrieve the monochromatic color.  

### Get analogous colors  

Call `::Color.get_analogous_scheme(hex_color)` to retrieve two colors analogue to the given one.  

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on [GitHub](https://github.com/TimHi/coloR). This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/TimHi/coloR/blob/master/CODE_OF_CONDUCT.md).

## Code of Conduct

Everyone interacting in the ColoR project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/TimHi/coloR/blob/master/CODE_OF_CONDUCT.md).
