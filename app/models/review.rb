class Review < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :reviewer, class_name: 'User'
  has_many :photos
  has_many :votes
end
