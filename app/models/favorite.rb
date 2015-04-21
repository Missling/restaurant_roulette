class Favorite < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :restaurant
end
