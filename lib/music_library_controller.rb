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

            case user_input 
            when "list songs"
                list_songs 
            when "list artists"
                list_artists
            when "list genres"
                list_genres
              when "list artist"
                list_songs_by_artist
              when "list genre"
                list_songs_by_genre
              when "play song"
                play_song
            end 
        end 

    end 

    def list_songs
        sorted_songs = Song.all.sort_by {|song| song.name}
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


    #   #list_songs_by_artist
    #   prompts the user to enter an artist
    #   Please enter the name of an artist:
    #       accepts user input
    #       prints all songs by a particular artist in a numbered list (alphabetized by song name)
    #       does nothing if no matching artist is found


    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        input = gets.strip 

        if x = Artist.find_by_name(input)
            x = x.songs.sort_by {|song| song.name}
            x.each.with_index(1) {|song, index| puts "#{index}. #{song.name} - #{song.genre.name}" }
        end
    end 

    def list_songs_by_genre 
        puts "Please enter the name of a genre:"
        input = gets.strip 

        if x = Genre.find_by_name(input)
            x = x.songs.sort_by {|song| song.name}
            x.each.with_index(1) {|song, index| puts "#{index}. #{song.artist.name} - #{song.name}"}
        end 
    end 

    #   #play_song
    #   prompts the user to choose a song from the alphabetized list output by #list_songs
    #   Which song number would you like to play?
    #       accepts user input
    #       upon receiving valid input 'plays' the matching song from the alphabetized list output by #list_songs
    #       does not 'puts' anything out if a matching song is not found
    #       checks that the user entered a number between 1 and the total number of songs in the library


    def play_song 
        puts "Which song number would you like to play?"
        input = gets.strip.to_i
        
        if (1..Song.all.size).include?(input)#Song.all[input]
            song = Song.all.sort_by {|song| song.name}[input -1]
            puts "Playing #{song.name} by #{song.artist.name}" 
        end 
    end 
end 



# -back to #call 
# MusicLibraryController - CLI Commands
#   'list songs'
#     triggers #list_songs
#   'list artists'
#     triggers #list_artists
#   'list genres'
#     triggers #list_genres
#   'list artist'
#     triggers #list_songs_by_artist
#   'list genre'
#     triggers #list_songs_by_genre
#   'play song'
#     triggers #play_song