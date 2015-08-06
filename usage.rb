$LOAD_PATH.unshift File.expand_path '../lib', __FILE__
require 'itunes_library_parser'
require 'pp'

xml = File.read("spec/iTunes Music Library.xml")
library = ItunesLibraryParser::Library.new(xml)

pp library.tracks
pp library.playlists
