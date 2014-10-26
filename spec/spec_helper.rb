require "simplecov"
require "capybara/poltergeist"

SimpleCov.start "rails" do
  add_filter "/vendor"
  use_merging false
end

# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)
require "rspec/rails"
require "capybara/rails"
require "capybara/rspec"

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}
include Helpers


RSpec.configure do |config|

  # added by default when you run 'rails generate rspec:install'
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # added by default when you run 'rails generate rspec:install'
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.include Capybara::DSL

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = false

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # render views for services as Jbuilder
  config.render_views = true

  # include routes helpers
  config.include Rails.application.routes.url_helpers

  config.before(:suite) do
    Capybara.javascript_driver = :poltergeist  # Set the default Javascript driver where the default is :selenium.
  end

  config.before(:each) do
  end

  config.after(:each) do
    Capybara.reset_sessions!              # Forget the (simulated) browser state
    Capybara.use_default_driver           # Revert Capybara.current_driver to Capybara.default_driver
  end

  config.after(:suite) do
  end

  Capybara.server_port = 8082
  Capybara.default_wait_time = 3

  # use colors
  config.color = true

end
