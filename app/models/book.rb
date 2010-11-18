class Book
  include MongoMapper::Document         

  #keys
  key :title
  key :author_id, ObjectId
# Validations :::::::::::::::::::::::::::::::::::::::::::::::::::::
 validates_presence_of :title
 validates_uniqueness_of :title
# Assocations :::::::::::::::::::::::::::::::::::::::::::::::::::::
 belongs_to :author

# Callbacks ::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# before_create :your_model_method
# after_create :your_model_method
# before_update :your_model_method 

# Attribute options extras ::::::::::::::::::::::::::::::::::::::::
# attr_accessible :first_name, :last_name, :email

# Validations
# key :name, :required =>  true      

# Defaults
# key :done, :default => false

# Typecast
# key :user_ids, Array, :typecast => 'ObjectId'     
end
