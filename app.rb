require 'rubygems'
require 'bundler/setup'
Bundler.require :default, ENV['RACK_ENV']

require_relative 'api'
