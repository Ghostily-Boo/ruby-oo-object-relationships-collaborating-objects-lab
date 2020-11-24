require 'pry'

class Artist
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self    
    end

    def self.find_or_create_by_name(artist)
        Artist.all.find {|each_artist| each_artist if
            each_artist.name == artist} ||
            Artist.new(artist)
    end

    def print_songs
        #why does putting pry in this method cause a very long chain of green and no pause?
        songs.each {|song| puts song.name}
    end

    #why is location returned too?
end
