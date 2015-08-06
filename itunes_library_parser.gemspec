# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'itunes_library_parser/version'

Gem::Specification.new do |spec|
  spec.name          = "itunes_library_parser"
  spec.version       = ItunesLibraryParser::VERSION
  spec.authors       = ["tongpoo"]
  spec.email         = ["tongpoo@users.noreply.github.com"]
  spec.summary       = %q{Parser for iTunes library xml file}
  spec.description   = %q{Parser for iTunes library xml file, to get tracks, playlists, and more.}
  spec.homepage      = "https://github.com/tongpoo/itunes_library_parser"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"

  spec.add_runtime_dependency 'nokogiri'
end
