class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, foreign_key: :recipe_id

  attribute :recipe_foods_counter, :integer, default: 0

  after_save :update_recipes_counter

  def update_recipes_counter
    user.increment!(:recipes_counter)
  end
end
