require 'bcrypt'

class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :itineraries, through: :invites
  has_many :invites

  validates :email, uniqueness: true
  validates :email, :password , presence: true

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
