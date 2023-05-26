class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, foreign_key: :recipe_id

  validates :name, presence: true
  validates :preparation_time, presence: true
  validates :cooking_time, presence: true
  validates :description, presence: true

  scope :by_user, ->(user) { where(user_id: user.id) }
end
