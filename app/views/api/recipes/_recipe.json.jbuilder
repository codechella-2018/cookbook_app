json.id recipe.id
json.title recipe.title
json.ingredients recipe.ingredients
json.directions recipe.directions
json.image_url recipe.image_url
json.prep_time recipe.prep_time
json.chef_name recipe.user.name
json.formatted do
	json.prep_time recipe.friendly_prep_time
	json.ingredients recipe.ingredients_array
	json.directions recipe.directions_array
end