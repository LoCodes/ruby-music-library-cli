require 'pry'

class Song 
    #extend Concerns::Findable

    attr_accessor :name
    attr_reader :artist, :genre

    @@all = []

        # #initialize
        # invokes #artist= instead of simply assigning to an @artist instance
        # variable to ensure that associations are created upon initialization

    def initialize(name, artist = nil, genre = nil )
        @name = name 
        self.artist = artist if artist   # invokes the artist= method to self, if there is an artist
        self.genre = genre if genre
        save
        # save
    end 

    # #artist=
    # invokes Artist#add_song to add itself to the artist's
    #  collection of songs (artist has many songs) 

    def artist=(artist)
        @artist = artist 
        artist.add_song(self)
    end 

    def genre=(genre)
        @genre = genre
        genre.songs << self unless genre.songs.include? self # adds the song to the genre's collection of songs
        # unless - does not add the song to the genre's collection of songs if it already exists therein
    end 


    def save
        @@all << self
    end 


    def self.all 
        @@all 
    end  

    def self.destroy_all
        all.clear
    end 

    # .create
    # initializes, saves, and returns the song 
    def self.create(name)
        song = Song.new(name)  #Song.new 
        song
    end 


       
#   Song
#   .find_by_name
#     finds a song instance in @@all by the name property of the song
# .find_or_create_by_name
#     returns (does not recreate) an existing song with the provided name if one exists in @@all
#     invokes .find_by_name instead of re-coding the same functionality
#     creates a song if an existing match is not found
#     invokes .create instead of re-coding the same functionality

    def self.find_by_name(name) 
        all.find {|song| song.name == name}
    end  

    def self.find_or_create_by_name(name)
        find_by_name(name) || create(name)
    end 

# Song
# .new_from_filename
#   initializes a song based on the passed-in filename
#   invokes the appropriate Findable methods so as to avoid duplicating objects

    def self.new_from_filename(file)
        # song_name = name.split(" - ")[1]
        # artist_name = name.split(" - ")[0]
        # genre_name = name.split(" - ")[2].chomp(".mp3")
        # song = self.find_or_create_by_name(song_name)
        # song.artist = Artist.find_or_create_by_name(artist_name)
        # song.genre = Genre.find_or_create_by_name(genre_name)
        # song
  
        artist, song, genre = file.split(" - ")
        # file - "Thundercat - For Love I Come - dance.mp3"
        genre = genre.gsub(".mp3", "")

        
        artist = Artist.find_or_create_by_name(artist)
        genre = Genre.find_or_create_by_name(genre)
        new(song, artist, genre)
    end 

# .create_from_filename
# initializes and saves a song based on the passed-in filename
# invokes .new_from_filename instead of re-coding the same functionality
    
    def self.create_from_filename(file)
        new_from_filename(file)
    end 


end 