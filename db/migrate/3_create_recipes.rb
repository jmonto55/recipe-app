class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|

      t.timestamps
    end
  end
end
