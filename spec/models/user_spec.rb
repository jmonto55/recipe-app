require 'rails_helper'

RSpec.describe User, type: :model do
  before(:example) do
    @user = User.create(name: 'Tom', email: 'tom@mail.com')
    recipe1 = Recipe.create(
      name: 'Rice with shrimp',
      preparation_time: 1,
      cooking_time: 2,
      description: 'cook shrimp and mix with rice and vegetables',
      public: true,
      user_id: @user.id
    )
    recipe2 = Recipe.create(
      name: 'Chocolate cake',
      preparation_time: 1,
      cooking_time: 2,
      description: 'mix flour, add eggs, add chocolate, cook in the oven',
      public: true,
      user_id: @user.id
    )
    @user.recipes << recipe1 << recipe2
  end
  it 'the User has the correct name' do
    expect(@user.name).to eq('Tom')
  end
  it 'returns User has the correct email' do
    expect(@user.email).to eq('tom@mail.com')
  end
  it 'returns all user recipes' do
    expect(@user.retrieve_all_user_recipes).to match_array(@user.recipes)
  end
end
