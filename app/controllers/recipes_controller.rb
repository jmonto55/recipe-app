class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]

  # GET /recipes or /recipes.json
  def index
    @recipes = current_user.retrieve_all_user_recipes.includes(:user)
  end

  def public_recipes
    @recipes = Recipe.includes(:user).where(public: true)
  end

  def general_shopping_list
    user_recipes = current_user.recipes
    user_foods = current_user.foods
    recipe_foods = RecipeFood.where(recipe_id: user_recipes.pluck(:id))
    recipe_food_quantity = get_recipe_foods_quantity(recipe_foods)

    get_general_shopping_list(user_foods, recipe_food_quantity)
  end

  def add_food
    @foods = Food.all
  end

  # GET /recipes/1 or /recipes/1.json
  def show
    @recipe_foods = RecipeFood.includes(:food).where(recipe_id: @recipe.id)
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit; end

  # POST /recipes or /recipes.json
  def create
    @recipe = current_user.recipes.build(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipe_url(@recipe) }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      # Handle successful update
      redirect_to @recipe, notice: 'Recipe was successfully updated.'
    else
      # Handle update failure
      render :edit
    end
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe.recipe_foods.destroy_all
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end

def get_recipe_foods_quantity(recipe_foods)
  recipe_food_quantity = {}
  recipe_foods.includes(:food).each do |food|
    name = food.food.name
    if recipe_food_quantity[name].nil?
      recipe_food_quantity[name] = food.quantity
    else
      recipe_food_quantity[name] += food.quantity
    end
  end

  recipe_food_quantity
end

def get_general_shopping_list(user_foods, recipe_food_quantity)
  @general_shopping_list = []
  user_foods.each do |food|
    name = food.name
    quantity = food.quantity
    price = food.price
    next unless recipe_food_quantity[name]

    r_quantity = recipe_food_quantity[name]
    next unless quantity < r_quantity

    g_quantity = r_quantity - quantity
    g_price = g_quantity * price
    @general_shopping_list << { name:, quantity: g_quantity, price: g_price }
  end

  @general_shopping_list
end
