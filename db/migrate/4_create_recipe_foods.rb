# db/migrate/20230523000000_create_recipe_foods.rb

class CreateRecipeFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_foods do |t|
      t.float :quantity
      t.references :recipe, null: false, foreign_key: true
      t.references :food, null: false, foreign_key: true

      t.timestamps
    end
  end
end
