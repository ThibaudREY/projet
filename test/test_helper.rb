ENV['RAILS_ENV'] ||= 'test'

require 'simplecov'
SimpleCov.start 'rails' do
  add_group 'Validators', 'app/validators'
  add_filter '/config/'
  add_filter '/lib/tasks'
  add_filter '/test/'
  add_filter '/vendor/'
end
require 'coveralls'
SimpleCov.formatters = [SimpleCov::Formatter::HTMLFormatter,
                        Coveralls::SimpleCov::Formatter]

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
