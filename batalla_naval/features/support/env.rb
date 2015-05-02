require File.expand_path(File.dirname(__FILE__) + "/../../config/boot")

require 'capybara/cucumber'
require 'rspec/expectations'

require 'simplecov'
require_relative '../../app/batalla_naval'

SimpleCov.start do
  root(File.join(File.dirname(__FILE__), '..','..'))
  coverage_dir 'reports/coverage'
  add_filter '/spec/'
  add_filter '/features/'
  add_filter '/admin/'
  add_filter '/db/'
  add_filter '/config/'
  add_group "Models", "app/models"
  add_group "Controllers", "app/controllers"
  add_group "Helpers", "app/helpers"
end


#Capybara.default_driver = :selenium
Capybara.app = BatallaNaval::App.tap { |app|  }
