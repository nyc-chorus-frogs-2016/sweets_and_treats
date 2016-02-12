class Photo < ActiveRecord::Base
  belongs_to :review
  has_one :reviewer, through: :review
end
