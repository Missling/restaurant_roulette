class Search < ActiveRecord::Base
  # Remember to create a migration!
  has_many :searches
  has_many :restaurants
  has_many :users, through: :searches

  validates :location, presence: true
end
