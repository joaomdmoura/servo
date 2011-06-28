class Client < ActiveRecord::Base

  acts_as_indexed :fields => [:name, :lastname, :username, :password, :email]

  validates :name, :presence => true, :uniqueness => true
  
end
