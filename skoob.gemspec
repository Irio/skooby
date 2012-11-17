# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'skoob/version'

Gem::Specification.new do |gem|
  gem.name          = "skoob"
  gem.version       = Skoob::VERSION
  gem.authors       = ["Irio Irineu Musskopf Junior"]
  gem.email         = ["irio.musskopf@caixadeideias.com.br"]
  gem.description   = "Gives you some API like's methods to access Skoob data"
  gem.summary       = "Gives you some API like's methods to access Skoob data"
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_development_dependency "minitest"
  gem.add_development_dependency "mocha"
  gem.add_dependency "httparty"
  gem.add_dependency "nokogiri"
end
