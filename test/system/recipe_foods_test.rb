require 'application_system_test_case'

class RecipeFoodsTest < ApplicationSystemTestCase
  setup do
    @recipe_food = recipe_foods(:one)
  end

  test 'visiting the index' do
    visit recipe_foods_url
    assert_selector 'h1', text: 'Recipe foods'
  end

  test 'should create recipe food' do
    visit recipe_foods_url
    click_on 'New recipe food'

    click_on 'Create Recipe food'

    assert_text 'Recipe food was successfully created'
    click_on 'Back'
  end

  test 'should update Recipe food' do
    visit recipe_food_url(@recipe_food)
    click_on 'Edit this recipe food', match: :first

    click_on 'Update Recipe food'

    assert_text 'Recipe food was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Recipe food' do
    visit recipe_food_url(@recipe_food)
    click_on 'Destroy this recipe food', match: :first

    assert_text 'Recipe food was successfully destroyed'
  end
end
