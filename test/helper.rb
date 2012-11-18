require 'skooby'
require 'minitest/autorun'
require 'mocha/setup'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'test/fixtures/cassettes'
  c.hook_into :fakeweb
end
