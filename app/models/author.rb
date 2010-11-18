class Author
  include MongoMapper::Document         

  key :name  
# Validations :::::::::::::::::::::::::::::::::::::::::::::::::::::
 validates_presence_of :name
 validates_uniqueness_of :name
# Assocations :::::::::::::::::::::::::::::::::::::::::::::::::::::
 many :books
end
