require 'skooby/version'
require 'httparty'

$LOAD_PATH << "./lib/skooby"
files = Dir[File.dirname(__FILE__) + "/skooby/*.rb"]
files.each { |f| require f }

module Skooby
end
