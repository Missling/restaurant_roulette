class Restaurant < ActiveRecord::Base
  # Remember to create a migration!
  has_many :users, through: :favorites
  has_many :favorites
end
