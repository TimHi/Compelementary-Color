# frozen_string_literal: true

require_relative "lib/color/version"

Gem::Specification.new do |spec|
  spec.name = "Complementary_Color"
  spec.version = ColoR::VERSION
  spec.authors = ["Tim Hiller"]
  spec.email = ["TimHiller@live.de"]
  spec.summary = "Generate aesthetic pleasing color schemes."
  spec.description = "Generate aesthetic pleasing color schemes. Current options are the complementary color to a given
  input, the monochromatic version to a given color and to generate two analogues colors to a given one. The gem also
  offers various conversions between the different color models."
  spec.homepage = "https://github.com/TimHi/coloR"
  spec.required_ruby_version = ">= 2.6.0"
  spec.license = "AGPL-3.0-or-later"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/TimHi/coloR"
  spec.metadata["changelog_uri"] = "https://github.com/TimHi/coloR/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.metadata["rubygems_mfa_required"] = "true"
end
