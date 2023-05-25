class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, foreign_key: :recipe_id

  validates :name, presence: true
  validates :preparation_time, presence: true
  validates :cooking_time, presence: true
  validates :description, presence: true

  attribute :recipe_foods_counter, :integer, default: 0
end
