require 'pry'

class Artist 
    extend Concerns::Findable

    attr_accessor :name
    attr_reader :songs

    @@all = []

    def initialize(name)
        @name = name 
        @songs = []
        save
    end 

    def save
        @@all << self 
    end 

    def self.all
        @@all
    end 

    def self.destroy_all
        @@all.clear
    end 

    def self.create(created_artist)
        artist = new(created_artist)
        artist 
    end 

#Associations
# #songs
# returns the artist's 'songs' collection (artist has many songs)

    # def songs 
    #     Song.all.map do |song|
    #         song
    #     end 
    # end 

# #add_song
#  assigns the current artist to the song's 'artist' property (song belongs to artist)
#  does not assign the artist if the song already has an artist
#  adds the song to the current artist's 'songs' collection
#  does not add the song to the current artist's collection of songs if it already exists therein


    def add_song(song)
        song.artist = self unless song.artist #== self
        @songs << song unless @songs.include?(song)
        #binding.pry
    end 

# Associations — Artist and Genre:
# Artist
#   #genres
#     returns a collection of genres for all of the artist's songs (artist has many genres through songs)
#     does not return duplicate genres if the artist has more than one song of a particular genre (artist has many genres through songs)

    def genres 
        songs.collect {|song| song.genre}.uniq
    end 






end 