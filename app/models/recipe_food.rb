class RecipeFood < ApplicationRecord
  belongs_to :food
  belongs_to :recipe
end
