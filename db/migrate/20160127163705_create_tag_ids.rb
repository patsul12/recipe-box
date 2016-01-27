class CreateTagIds < ActiveRecord::Migration
  def change
    create_table(:recipes_tags) do |rt|
      rt.column(:tag_id, :int)
      rt.column(:recipe_id, :int)
    end
  end
end
