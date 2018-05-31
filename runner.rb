require 'unirest'

params = {
	title: "Cake",
	chef: "Stephen C",
	ingredients: "Flour, eggs, sugar",
	directions: "Bake",
	prep_time: 45
}

response = Unirest.post("http://localhost:3000/api/recipes", parameters: params).body

puts JSON.pretty_generate(response)