class RenameIngredientColumn < ActiveRecord::Migration
  def change
    remove_column(:ingredients, :column, :string)
    add_column(:ingredients, :name, :string)
  end
end
