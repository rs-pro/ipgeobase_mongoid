# coding: utf-8

$:.push File.expand_path("../lib", __FILE__)
require "ipgeobase/version"

Gem::Specification.new do |s|
  s.name = "rs_ipgeobase_mongoid"
  s.version = Ipgeobase::VERSION
  s.authors = ["GlebTv"]
  s.email = ["glebtv@gmail.com"]
  s.homepage = "https://github.com/rs-pro/ipgeobase_mongoid"
  s.description = "IPGeoBase.ru for mongoid 6+"
  s.summary = "IPGeoBase.ru for mongoid 6+"

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency('mongoid', [">= 5.0", "< 8.0"])
  s.required_ruby_version = '>= 2.1.0'

  s.add_development_dependency("rake")
  s.add_development_dependency("bundler")
  s.add_development_dependency("rspec", [">= 2.14.0"])
end
