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
  @tags = Tag.all
  ingredient_list = []
  tag_list = []
  params.each do |param|
    if (/ingredient\d/.match(param[0]))
      if (!@ingredients.include?(param[1]))
        ingredient_list.push(Ingredient.create(name: param[1]))
      else
        ingredient_list.push(Ingredient.update(Ingredient.find_by name: param[1]))
      end
    end
  end

  params.each do |param|
    if (/tag\d/.match(param[0]))
      if (!@tags.include?(param[1]))
        tag_list.push(Tag.create(name: param[1]))
      else
        tag_list.push(Tag.update(Tag.find_by name: param[1]))
      end
    end
  end

  name = params[:recipe_name]
  instructions = params[:instructions]
  recipe = Recipe.create({name: name, instructions: instructions})
  ingredient_list.each do |ingredient|
    recipe.ingredients.push(ingredient)
  end
  tag_list.each do |tag|
    recipe.tags.push(tag)
  end
  redirect '/'
end

get '/recipes/:id' do
  @recipe = Recipe.find(params[:id])
  erb :recipe
end

patch '/recipes/:id' do
  @recipe = Recipe.find(params[:id])
  @ingredients = Ingredient.all
  @tags = Tag.all
  ingredient_list = []
  params.each do |param|
    if (/ingredient\d/.match(param[0]))
      if (Ingredient.find_by(name: param[1]).name != param[1])
        ingredient_list.push(Ingredient.create(name: param[1]))
      else
        ingredient_list.push(Ingredient.find_by(name: param[1]))
      end
    end
  end

  if params[:add_tag].length > 0
    if (Tag.find_by(name: params[:add_tag]).nil?)
      @recipe.tags.push(Tag.create(name: params[:add_tag]))
    end
  end

  name = params[:recipe_name]
  instructions = params[:instructions]
  ingredient_list.each do |ingredient|
    if !@recipe.ingredients.include?(ingredient)
      @recipe.ingredients.push(ingredient)
    end
  end
  @recipe.update(name: name)
  redirect "/recipes/#{@recipe.id}"
end

delete '/recipes/:id' do
  Recipe.find(params[:id]).destroy
  redirect "/"
end
