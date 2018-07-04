var recipeTemplate = document.querySelector('#recipe-card');
var recipeRow = document.querySelector(".row");

/* global axios */
axios.get("http://localhost:3000/api/recipes").then(function(response){
	var recipes = response.data;
	console.log(recipes);

	// for each recipe, create a recipeTemplate card with that recipes data
	recipes.forEach(function(recipe){
		var recipeClone = recipeTemplate.content.cloneNode(true);
		recipeClone.querySelector(".card-img-top").src = recipe.image_url;
		recipeClone.querySelector(".card-title").innerText = recipe.title;
		recipeClone.querySelector(".chef").innerText = recipe.chef_name;
		recipeClone.querySelector(".prep-time").innerText = recipe.formatted.prep_time;
		recipeClone.querySelector(".ingredients").innerText = recipe.formatted.ingredients;
		recipeRow.appendChild(recipeClone);
	});
})