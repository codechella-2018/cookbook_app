require 'unirest'

# puts "Enter recipe title:"
# title = gets.chomp

# params = {
# 	title: title,
# 	chef: "Stephen C",
# 	ingredients: "Flour, eggs, sugar",
# 	directions: "Bake",
# 	prep_time: 45
# }

# response = Unirest.post("http://localhost:3000/api/recipes", parameters: params).body

# puts JSON.pretty_generate(response)


puts "What recipe id would you like to update?"
recipe_id = gets.chomp

params = {
	# title: "Cake!!!",
	chef: "Stephen C",
	ingredients: "Flour, eggs, sugar",
	directions: "Bake",
	prep_time: 45
}

response = Unirest.patch("http://localhost:3000/api/recipes/#{recipe_id}", parameters: params).body

puts JSON.pretty_generate(response)

