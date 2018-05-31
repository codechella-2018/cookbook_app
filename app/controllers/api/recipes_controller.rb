class Api::RecipesController < ApplicationController

	def index
		@recipes = Recipe.all #all recipes in database as an array
		render "index.json.jbuilder"
	end

	def show
		recipe_id = params[:id]
		@recipe = Recipe.find_by(id: recipe_id)
		render "show.json.jbuilder"
	end
end
