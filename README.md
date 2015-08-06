# ItunesLibraryParser

A simple parse for iTunes library file by ruby.
You can get whole tracks, playlists, artists, and more from your iTunes library file.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'itunes_library_parser', git: 'git://github.com/tongpoo/itunes_library_parser.git'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install specific_install
    $ gem specific_install -l 'git://github.com/tongpoo/itunes_library_parser.git'

## Usage

### Parse iTunes Library

To Parse iTunes Library, Simply create ItunesLibraryParser::Library instance.

```ruby
xml = File.read("iTunes Music Library.xml")
library = ItunesLibraryParser::Library.new(xml)
```

### Get whole tracks and playlists

To Get whole tracks from parsed library, call `tracks`. That return Array of hash with each track information.

```ruby
pp library.tracks
# => [{:track_id=>117,
#  :name=>"Come Together",
#  :artist=>"The Beatles",
#  :album=>"Abbey Road",
#  :track_number=>1,
#  :track_count=>18},
# {:track_id=>119,
#  :name=>"Something",
#  :artist=>"The Beatles",
#  :album=>"Abbey Road",
#  :track_number=>2,
#  :track_count=>18,
#  :purchased=>true,
#  :visible=>false}
#  ...
#  ]
```

To Get playlists, call `playlists`. That return Array of hash with each playlists information.

```ruby
pp library.playlists
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/itunes_library_parser/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
