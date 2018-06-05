json.id @recipe.id
json.title @recipe.title
json.ingredients @recipe.ingredients
json.directions @recipe.directions
json.chef @recipe.chef
json.image_url @recipe.image_url
json.prep_time @recipe.prep_time

json.formatted do
	json.ingredients @recipe.ingredients_array
	json.directions @recipe.directions_array
	json.created_at @recipe.friendly_created_at
	json.prep_time @recipe.friendly_prep_time
 end
