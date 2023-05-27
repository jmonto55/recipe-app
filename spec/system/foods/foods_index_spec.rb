require 'rails_helper'

RSpec.describe 'Food Index', type: :system do
  before(:each) do
    @user = User.create(name: 'Jose', email: 'jose@mail.com', password: '2e2010510',
                        password_confirmation: '2e2010510')
    @food = Food.create(
        name: 'Beans',
        measurement_unit: 'grams',
        price: 10.0,
        quantity: 500,
        user_id: @user.id
      )
  end

#   it 'User should log in' do
#     visit new_user_session_path
#     fill_in 'Email', with: @user.email
#     sleep(2)
#     fill_in 'Password', with: @user.password
#     click_button('login')
#     sleep(3)
#   end

  it 'User should be able to create add a new Food' do
    visit root_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    sleep(3)
    click_button('login')

    sleep(2)
    click_link('add-food')

    fill_in 'Food Name', with: @food.name
    sleep(3)
    fill_in 'Price', with: @food.price
    fill_in 'Quantity', with: @food.quantity
    click_button('submit')
    sleep(3)
  end
end