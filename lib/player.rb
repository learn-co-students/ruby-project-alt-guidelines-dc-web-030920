class Player < ActiveRecord::Base 
has_many :sessions
has_many :coaches, :through => :sessions

end