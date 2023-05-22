require 'test_helper'

class RecipeFoodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recipe_food = recipe_foods(:one)
  end

  test 'should get index' do
    get recipe_foods_url
    assert_response :success
  end

  test 'should get new' do
    get new_recipe_food_url
    assert_response :success
  end

  test 'should create recipe_food' do
    assert_difference('RecipeFood.count') do
      post recipe_foods_url, params: { recipe_food: {} }
    end

    assert_redirected_to recipe_food_url(RecipeFood.last)
  end

  test 'should show recipe_food' do
    get recipe_food_url(@recipe_food)
    assert_response :success
  end

  test 'should get edit' do
    get edit_recipe_food_url(@recipe_food)
    assert_response :success
  end

  test 'should update recipe_food' do
    patch recipe_food_url(@recipe_food), params: { recipe_food: {} }
    assert_redirected_to recipe_food_url(@recipe_food)
  end

  test 'should destroy recipe_food' do
    assert_difference('RecipeFood.count', -1) do
      delete recipe_food_url(@recipe_food)
    end

    assert_redirected_to recipe_foods_url
  end
end
