class Api::RecipesController < ApplicationController

	def index
		@recipes = Recipe.all #all recipes in database as an array
		render "index.json.jbuilder"
	end

	def show
		recipe_id = params[:id]
		@recipe = Recipe.find_by(id: recipe_id) #single recipe hash
		render "show.json.jbuilder"
	end

	def create
		@recipe = Recipe.create(
			title: params[:title],
			chef: params[:chef],
			ingredients: params[:ingredients],
			directions: params[:directions],
			prep_time: params[:prep_time]
		) #new recipe hash
		render "show.json.jbuilder"
	end

	def update
		#find the recipe to update
		recipe_id = params[:id]
		@recipe = Recipe.find_by(id: recipe_id)
		#tell it what info to update
		@recipe.title = params[:title] || @recipe.title
		@recipe.chef = params[:chef] || @recipe.chef
		@recipe.ingredients = params[:ingredients] || @recipe.ingredients
		@recipe.directions = params[:directions] || @recipe.directions
		@recipe.prep_time = params[:prep_time] || @recipe.prep_time

		@recipe.save
		render "show.json.jbuilder"
	end

end















