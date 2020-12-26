require 'pry'

class MusicImporter 

    attr_accessor :path

    #@@all = []

    def initialize(path)
        @path = path
        #save
    end 

    # def save
    #     @@all << self
    # end 

    # def self.all
    #     @@all
    # end 

    def files 
        Dir.glob("#{@path}/*").collect{ |file| file.gsub("#{@path}/", "") } 
        # #loads all the MP3 files in the path directory
        # normalizes the filename to just the MP3 filename with no path
        # ["./spec/fixtures/mp3s/Jurassic 5 - What's Golden - hip-hop.mp3", 
        #     "./spec/fixtures/mp3s/Real Estate -...at - For Love I Come - dance.mp3", 
        #     "./spec/fixtures/mp3s/Action Bronson - Larry Csonka - indie.mp3"] 
        #     to include "Action Bronson - Larry Csonka - indie.mp3"
        #RESULT:
        # ["Jurassic 5 - What's Golden - hip-hop.mp3",
        #     "Real Estate - It's Real - hip-hop.mp3",
        #     "Real Estate - Green Aisles - country.mp3",
        #     "Thundercat - For Love I Come - dance.mp3",
        #     "Action Bronson - Larry Csonka - indie.mp3"]
    end  

# MusicImporter
# #import
#   imports the files into the library by invoking Song.create_from_filename    

    def import
        files.each {|file| Song.create_from_filename(file)}
    end 



end 