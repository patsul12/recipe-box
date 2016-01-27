require 'spec_helper'

describe Recipe do
  describe "#new" do
    it 'creates a new recipe' do
      new_recipe = Recipe.create({ingredients: "few things", instructions: "cook it" })
      expect(new_recipe.ingredients).to(eq("few things"))
    end
    it 'creates a new recipe with instructions' do
      new_recipe = Recipe.create({ingredients: "few things", instructions: "cook it" })
      expect(new_recipe.instructions).to(eq("cook it"))
    end
  end
end
