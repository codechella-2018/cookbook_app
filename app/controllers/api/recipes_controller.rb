class Api::RecipesController < ApplicationController

	# current_user = User.find_by(email: "dani@gmail.com")

	def index
		@recipes = Recipe.all #all recipes in database as an array

		if params[:search]
			@recipes = Recipe.where("title LIKE ?", "%#{params[:search]}%")
		end

		@recipes = @recipes.order(:title)

		# if current_user
  #     @recipes = current_user.recipes
  #     render "index.json.jbuilder"
  #   else
  #     render json: []
  #   end


		render "index.json.jbuilder"
	end

	def show
		@recipe = Recipe.find_by(id: params[:id]) #single recipe hash
		render "show.json.jbuilder"
	end

	def create
		@recipe = Recipe.create(
			title: params[:title],
			ingredients: params[:ingredients],
			directions: params[:directions],
			prep_time: params[:prep_time],
			image_url: params[:image_url],
			user_id: current_user.id
		) #new recipe hash
		render "show.json.jbuilder"
	end

	def update
		#find the recipe to update
		recipe_id = params[:id]
		@recipe = Recipe.find_by(id: recipe_id)
		#tell it what info to update
		@recipe.title = params[:title] || @recipe.title
		@recipe.ingredients = params[:ingredients] || @recipe.ingredients
		@recipe.directions = params[:directions] || @recipe.directions
		@recipe.prep_time = params[:prep_time] || @recipe.prep_time
		@recipe.image_url = params[:image_url] || @recipe.image_url

		@recipe.save
		render "show.json.jbuilder"
	end

	def destroy
		recipe_id = params[:id]
		@recipe = Recipe.find_by(id: recipe_id)
		@recipe.destroy
		render json: {message: "Recipe successfully destroyed"}
	end

end















