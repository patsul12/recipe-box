class AddIngredientTable < ActiveRecord::Migration
  def change
    create_table(:ingredients) do |i|
      i.string :column
    end

    create_table(:ingredients_recipes) do |ri|
      ri.column(:ingredient_id, :int)
      ri.column(:recipe_id, :int)
    end
  end
end
