class RecipeFood < ApplicationRecord
  belongs_to :food
  belongs_to :recipe

  def update_recipe_foods_counter
    user.increment!(:recipe_foods_counter)
  end
end
