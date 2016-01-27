class AddNameToRecipes < ActiveRecord::Migration
  def change
    change_table(:recipes) do |r|
      r.string :name
    end
  end
end
