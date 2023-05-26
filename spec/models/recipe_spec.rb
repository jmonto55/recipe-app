require 'rails_helper'

RSpec.describe Recipe, type: :model do
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

  describe 'attributes' do
    it 'has a name' do
      expect(recipe.name).to eq('rice with shrimp')
    end

    it 'has a preparation time' do
      expect(recipe.preparation_time).to eq(1)
    end

    it 'has a cooking time' do
      expect(recipe.cooking_time).to eq(2)
    end

    it 'has a description' do
      expect(recipe.description).to eq('cook shrimp and mix with rice and vegetables')
    end
  end
end
