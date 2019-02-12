lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "lavatar/version"

Gem::Specification.new do |spec|
  spec.name         = "lavatar"
  spec.version      = Lavatar::VERSION
  spec.authors      = ["Juraj Kostolansky"]
  spec.email        = ["juraj@kostolansky.sk"]

  spec.summary      = "Generate letter avatars in Ruby on Rails"
  spec.homepage     = "https://github.com/jkostolansky/lavatar"
  spec.license      = "MIT"

  spec.files        = Dir["README.md", "LICENSE.txt", "lavatar.gemspec", "lib/lavatar/*.rb"]
  spec.require_path = "lib"

  spec.add_dependency "actionpack"
end
