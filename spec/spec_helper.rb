require 'rack/test'
require 'rspec'
require 'capybara'
require 'capybara/rspec'
require_relative '../lib/Statext'

Capybara.app = Statext

ENV['RACK_ENV'] = 'test'

module RSpecMixin
  include Rack::Test::Methods
  def app() described_class end
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.include RSpecMixin

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.include Capybara::DSL
  config.shared_context_metadata_behavior = :apply_to_host_groups

end
