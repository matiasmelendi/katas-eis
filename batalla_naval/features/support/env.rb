require File.expand_path(File.dirname(__FILE__) + "/../../config/boot")

require 'capybara/cucumber'
require 'rspec/expectations'

require_relative '../../app/battleship_app'

Capybara.javascript_driver = :selenium
Capybara.app = BatallaNaval::BattleshipApp.tap { |app| }
