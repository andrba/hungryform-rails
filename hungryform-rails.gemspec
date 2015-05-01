# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hungryform/rails/version'

Gem::Specification.new do |spec|
  spec.name          = "hungryform-rails"
  spec.version       = HungryForm::Rails::VERSION
  spec.platform      = Gem::Platform::RUBY
  spec.authors       = ["Andrey Bazhutkin"]
  spec.email         = ["andrey.bazhutkin@gmail.com"]
  spec.summary       = "Use HungryForm with Rails"
  spec.description   = "A gem to automate using HungryForm with Rails"
  spec.homepage      = "https://github.com/andrba/hungryform-rails"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 2.0.0'
  
  spec.add_dependency 'hungryform',   '~> 0.0', '>= 0.0.8'
  spec.add_development_dependency 'rails',       '>= 4.2.1'

  spec.add_development_dependency "rspec",       '~> 3.0'
  spec.add_development_dependency "rspec-rails", '~> 3.0'
  spec.add_development_dependency "capybara",    '~> 2.4'
  spec.add_development_dependency "poltergeist", '~> 1.6'
end
