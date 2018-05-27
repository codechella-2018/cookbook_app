class Api::RecipesController < ApplicationController
	def recipe_action
		@recipe = Recipe.first #recipe hash
		render "recipe_view.json.jbuilder"
	end
end
