require "test_helper"

require 'capybara'
require 'capybara/rails'
require 'capybara/dsl'
require 'capybara/poltergeist'



class ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL
end

class FooTest < ActionController::IntegrationTest

  setup do
    Capybara.javascript_driver = :poltergeist
    Capybara.current_driver =    :poltergeist
  end

  test "foo" do
    visit '/posts/new'
    puts page.html
    assert page.has_css?('textarea.content')
  end
end