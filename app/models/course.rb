class Course < ActiveRecord::Base
  
  has_many :users, through: :activities
  has_many :activities
end
