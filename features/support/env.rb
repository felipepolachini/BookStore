require 'cucumber'
require 'rspec'
require 'httparty'
require 'yaml'

CONFIG = YAML.load_file("#{Dir.pwd}/config/config.yml")


