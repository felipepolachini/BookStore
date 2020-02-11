require 'cucumber'
require 'faker'
require 'rspec'
require 'httparty'
require 'yaml'
require 'report_builder'
require_relative 'helper.rb'

CONFIG = YAML.load_file("#{Dir.pwd}/config/config.yml")

World(Helper)
