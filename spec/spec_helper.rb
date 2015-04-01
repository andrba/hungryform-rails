ENV["RAILS_ENV"] = 'test'

Bundler.require
require "hungryform-rails"

require 'dummy/app'
require 'rspec/rails'
require 'capybara/rails'
require 'capybara/poltergeist'

Capybara.javascript_driver = :poltergeist

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir['./spec/support/**/*.rb'].each { |f| require f }
Dir['./spec/elements/shared_examples/**/*.rb'].each { |f| require f }
Dir['./spec/views/shared_examples/**/*.rb'].each { |f| require f }

RSpec.configure do |config|
  config.order = :random
  config.infer_spec_type_from_file_location!
end