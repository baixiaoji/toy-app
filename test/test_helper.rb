ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all
    include ApplicationHelper
    # Add more helper methods to be used by all tests here...

    #如何用户已登录，返回 true
    def is_logged_in?
      !session[:user_id].nil?
    end
  end
end
