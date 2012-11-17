require "skoob/version"
require 'httparty'
require 'nokogiri'
require 'open-uri'

module Skoob
end

$LOAD_PATH << "./lib/skoob"
files = Dir[File.dirname(__FILE__) + "/skoob/*.rb"]
files.each { |f| require f }
