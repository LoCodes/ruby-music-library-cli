require 'pry'

class MusicLibraryController 


    def initialize(file = "./db/mp3s")
       MusicImporter.new(file).import  
    end 

    def call
        user_input = ""
        while user_input != "exit"
        puts "Welcome to your music library!"
        puts "To list all of your songs, enter 'list songs'."
        puts "To list all of the artists in your library, enter 'list artists'."
        puts "To list all of the genres in your library, enter 'list genres'."
        puts "To list all of the songs by a particular artist, enter 'list artist'."
        puts "To list all of the songs of a particular genre, enter 'list genre'."
        puts "To play a song, enter 'play song'." 
        puts "To quit, type 'exit'."
        puts "What would you like to do?"
        user_input = gets.strip
        end        
    end 

    def list_songs
        sorted_songs = Song.all.sort_by {|song| song.name}
        #binding.pry
        sorted_songs.each.with_index {|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
    end 

    def list_artists
        sorted_artists = Artist.all.sort_by {|artist| artist.name}
        #binding.pry
        sorted_artists.each.with_index {|artist, index| puts "#{index + 1}. #{artist.name}"}
    end 

    def list_genres
        sorted_genres = Genre.all.sort_by {|genre| genre.name}
        sorted_genres.each.with_index(1) {|genre, index| puts "#{index}. #{genre.name}"}
    end 


    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        input = gets.strip 

        if x = Artist.find_by_name(input)
            #binding.pry
            x = Song.all.sort_by {|song| song.artist.name}
            x.each.with_index(1) {|song, index| puts "#{index}. #{song.name} - #{song.genre.name}" }
        end
    end 
end 