require 'rails_helper'

RSpec.describe 'Recipes index page', type: :system do
  describe 'check the content of the index page' do
    before(:each) do
      @user = User.create(name: 'Tom', email: "tom@mail.com")
      @recipe = Recipe.create(
        name: "rice with shrimp",
        preparation_time: 1,
        cooking_time: 2,
        description: "cook shrimp and mix with rice and vegetables",
        public: true,
        user_id: @user.id
      )
    end

    feature 'Recipe show' do
      background do
        allow(controller).to receive(:current_user).and_return(user)

        host = 'http://localhost:3000'
        visit url_for(controller: 'recipes', action: 'index', user_id: @user.id, host: host)
      end

      it 'I can see the Header "Recipes" in the index page' do
        expect(page).to have_content('Recipes')
      end

      it 'I can see the recipe\'s description' do
        @recipes = Recipe.where(user_id: @user.id)
        expect(page).to have_content 'cook shrimp and mix with rice and vegetables'
      end
    end
  end
end
