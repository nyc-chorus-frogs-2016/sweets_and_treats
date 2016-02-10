class User < ActiveRecord::Base
  has_secure_password
  has_many :restaurants
  has_many :reviews
  has_many :photos, through: :reviews
end
