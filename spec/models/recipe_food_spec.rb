require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  let(:user) { User.new(name: 'Tom', email: 'tom@mail.com') }
  let(:recipe) do
    Recipe.create(
      name: 'rice with shrimp',
      preparation_time: 1,
      cooking_time: 2,
      description: 'cook shrimp and mix with rice and vegetables',
      public: true,
      user_id: user.id
    )
  end
  let(:food) do
    Food.create(
      name: 'Beans',
      measurement_unit: 'grams',
      price: 10.0,
      quantity: 500,
      user_id: user.id
    )
  end

  let(:recipe_food) { RecipeFood.new(quantity: 500, recipe_id: recipe.id, food_id: food.id) }

  describe 'attributes' do
    it 'has a specific quantity' do
      expect(recipe_food.quantity).to eq(500)
    end
  end
end
