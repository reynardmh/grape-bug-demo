ENV["RACK_ENV"] = 'test'
require 'rack/test'

require_relative '../app'
require_relative 'rack_spec_helper'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object. This is generally recommended, and will default to
    # `true` in RSpec 4.
    mocks.verify_partial_doubles = true
  end

  # config.include RSpec::Rails::RequestExampleGroup, type: :feature
  config.include RackSpecHelper
  config.filter_run focus: true
  config.filter_run pending: false
  config.run_all_when_everything_filtered = true

  config.order = "random"
end
