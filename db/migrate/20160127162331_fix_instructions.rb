class FixInstructions < ActiveRecord::Migration
  def change
    remove_column(:recipes, :instructrions, :string)
    add_column(:recipes, :instructions, :string)
  end
end
