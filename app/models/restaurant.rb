class Restaurant < ActiveRecord::Base
  belongs_to :category
  belongs_to :lister, class_name: 'User'
  has_many :reviews
  has_many :photos, through: :reviews
end
