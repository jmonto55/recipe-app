require 'rails_helper'

RSpec.describe 'Recipe Show', type: :system do
  before(:each) do
    @user = User.create(name: 'Jose', email: 'jose@mail.com', password: '2e2010510',
                        password_confirmation: '2e2010510')
    @recipe = Recipe.create(user_id: @user.id, name: 'Hot dog', preparation_time: '2', cooking_time: '3',
                            description: 'Amazing hot hot dog')
    @food = Food.create(user_id: @user.id, name: 'sausage', measurement_unit: 'grams', price: '5', quantity: '200')
  end

  it 'User should be able to create a new Recipe and add ingredients' do
    visit root_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    sleep(2)
    click_button('login')

    click_link 'Recipes'
    sleep(2)
    click_link 'New recipe'

    fill_in 'Name', with: @recipe.name
    fill_in 'Preparation time', with: @recipe.preparation_time
    fill_in 'Cooking time', with: @recipe.cooking_time
    fill_in 'Description', with: @recipe.description
    sleep(1)
    click_button('submit')
    sleep(2)
    
    click_link 'Add ingredient'
    fill_in 'Quantity', with: 2
    click_button('submit')
    sleep(2)
  end
end
