module Concerns::Findable 


    def find_by_name(name) 
        self.all.find {|song| song.name == name}
    end  


    def find_or_create_by_name(name)
        self.find_by_name(name) || self.create(name)
    end 
end 


# Concerns::Findable
#   .find_by_name
#     is added as a class method to classes that extend the module
#     isn't hard-coded
#     works exactly like a generic version of Song.find_by_name,
#       searching the extended class's @@all variable for an instance that matches the provided name
#   .find_or_create_by_name
#     is added as a class method to classes that extend the module
#     works exactly like a generic version of Song.find_or_create_by_name:
#       finds (does not recreate) an existing instance with the provided name if one exists in @@all
#       isn't hard-coded
#       invokes .find_by_name instead of re-coding the same functionality
#       invokes the extended class's .create method, passing in the provided name, if an existing match is not found