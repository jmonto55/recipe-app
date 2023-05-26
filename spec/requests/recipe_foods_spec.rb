require 'rails_helper'

RSpec.describe 'RecipeFoods', type: :request do
  describe 'GET /index' do
    before(:example) do
      user = User.create(name: 'Tom', email: 'tom@mail.com')
      recipe = Recipe.create(
        name: 'rice with shrimp',
        preparation_time: 1,
        cooking_time: 2,
        description: 'cook shrimp and mix with rice and vegetables',
        public: true,
        user_id: user.id
      )
      food = Food.create(
        name: 'Beans',
        measurement_unit: 'grams',
        price: 10.0,
        quantity: 500,
        user_id: user.id
      )
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      get "/recipes/#{recipe.id}"
    end

    it 'should return success' do
      expect(response).to have_http_status(:ok)
    end

    it 'should return a 200 response status code' do
      expect(response).to have_http_status 200
    end

    it 'should render index template' do
      expect(response).to render_template('index')
    end

    it 'include the correct text' do
      expect(response.body).to include('Foods')
    end
  end
end
