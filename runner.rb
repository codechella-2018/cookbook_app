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


# # puts "What recipe id would you like to update?"
# # recipe_id = gets.chomp

# # params = {
# # 	# title: "Cake!!!",
# # 	chef: "Stephen C",
# # 	ingredients: "Flour, eggs, sugar",
# # 	directions: "Bake",
# # 	prep_time: 45
# # }

# # response = Unirest.patch("http://localhost:3000/api/recipes/#{recipe_id}", parameters: params).body

# # puts JSON.pretty_generate(response)


# puts "What recipe id would you like to destroy?"
# recipe_id = gets.chomp

# response = Unirest.delete("http://localhost:3000/api/recipes/#{recipe_id}").body

# puts JSON.pretty_generate(response)

# response = Unirest.post(
#   "http://localhost:3000/users",
#   parameters: {
#     name: "Dani",
#     email: "dani@gmail.com",
#     password: "123",
#     password_confirmation: "123"
#   }
# )
# p response.body


response = Unirest.post(
  "http://localhost:3000/user_token",
  parameters: {
    auth: {
      email: "dani@gmail.com",
      password: "123"
    }
  }
)
# Save the JWT from the response (you can also save user info as well)
jwt = response.body["jwt"]
# Include the JWT in the headers of any future web requests
Unirest.default_header("Authorization", "Bearer #{jwt}")

p "JWT =============== #{jwt}"

















