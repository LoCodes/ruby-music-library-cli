class Genre    
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

    def self.create(created_genre)
        genre = self.new(created_genre)
        genre
    end 

    # Genre
    # #artists
    #   returns a collection of artists for all of 
    #   the genre's songs (genre has many artists through songs) 
    #   does not have duplicates

    def artists
        songs.collect {|song| song.artist}.uniq
    end 
end 