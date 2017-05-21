require "bundler/setup"
require "site_prism/tableish"
require 'capybara/dsl'
require 'selenium/webdriver'

Capybara.default_driver = :selenium

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
