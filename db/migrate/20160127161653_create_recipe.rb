class CreateRecipe < ActiveRecord::Migration
  def change
    create_table(:recipes) do |r|
      r.column(:ingredients, :string)
      r.column(:instructrions, :string)
    end
  end
end
