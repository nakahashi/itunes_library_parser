require 'nokogiri'
require 'date'

module ItunesLibraryParser
  class Library
    # @return Array of Hash. Hash's keys are tags of track.
    attr :tracks
    # @return Array of Hash. Hash's keys are tags of Playlist.
    attr :playlists

    def albums
      # @todo Implement..
      raise NotImplementedError.new
    end

    def initialize(lib_xml)
      @tracks = []
      @playlists = []

      doc = Nokogiri::XML(lib_xml)

      tracks_nodeset = doc.xpath('/plist/dict/dict/dict')
      @tracks = build_tracks tracks_nodeset

      playlists_nodeset = doc.xpath('/plist/dict/array/dict')
      @playlists = build_playlists(playlists_nodeset)
    end

    private
    def build_tracks(nodeset)
      nodeset.reduce([]) do |tracks, element|
        keys = element.children.select { |e| e.name == 'key' }
        tracks << keys.reduce({}) do |track, key_e|
          set_key_value(track, key_e)
          track
        end
      end
    end

    def build_playlists(nodeset)
      nodeset.reduce([]) do |playlists, element|
        keys = element.children.select { |e| e.name == 'key' }
        playlists << keys.reduce({}) do |playlist, key_e|
          if key_e.text == 'Playlist Items'
            set_tracks_of_playlist(playlist, key_e.next_element.children.children)
          else
            set_key_value(playlist, key_e)
          end

          playlist
        end
      end
    end

    def set_key_value(hash, key_e)
      key_text = key_e.text.gsub(' ', '_').downcase
      value_e = key_e.next_element

      hash[key_text.to_sym] = case value_e.name
        when 'string'  then value_e.text
        when 'integer' then value_e.text.to_i
        when 'date'    then Date.strptime value_e.text
        when 'true'    then true
        when 'false'   then false
        else nil
        end
    end

    def set_tracks_of_playlist(playlist, nodeset)
      playlist[tracks] = []
      ids = nodeset.select { |e| e.name == 'integer' }
      ids.each do |e|
        track = @tracks.select { |t| t[:track_id] == e.text.to_i }.first
        playlist[tracks] << track if !track.nil?
      end
    end
  end
end
