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

end
