class Restaurant < ActiveRecord::Base
  belongs_to :category
  belongs_to :lister, class_name: 'User'
  has_many :reviews
  has_many :photos, through: :reviews

  def editable_by? user
    lister == user
  end

  def reviewable_by? user
    # self.reviews.include?(user)
  end
end
