require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require './lib/recipe'
require './lib/ingredient'
require './lib/tag'
require 'pry'
also_reload( './lib/**/*.rb')

get '/' do
  @recipes = Recipe.all
  @ingredients = Ingredient.all
  erb :index
end

post '/recipes' do
  @ingredients = Ingredient.all
  ingredient_list = []
  params.each do |param|
    if (/ingredient\d/.match(param[0]))
      if (!@ingredients.include?(param[1]))
        ingredient_list.push(Ingredient.create(name: param[1]))
      else
        ingredient_list.push(Ingredient.update(Ingredient.find_by name: param[1]))
      end
    end
  end
  name = params[:recipe_name]
  instructions = params[:instructions]
  recipe = Recipe.create({name: name, instructions: instructions})
  ingredient_list.each do |ingredient|
    recipe.ingredients.push(ingredient)
  end
  redirect '/'
end
