User.create!([
  {name: "Dani", email: "dani@gmail.com", password_digest: "$2a$10$03fgMXZsRJmRT7C08V5gl.LFvrchSruwOp0Vvo0yyUMf/9/euiIaW"},
  {name: "Peter", email: "peter@gmail.com", password_digest: "$2a$10$SfahhGq13pdey0WmATCG5Op.CuiGtcyuBIswItj.UBIHNYemfCu6K"},
  {name: "Jaron", email: "jaron@gmail.com", password_digest: "$2a$10$JrzoXzu5on8F6tZ41C8bQ.B55LRFCpeA1f5T2/j4YeqUaUPG6pw.O"},
  {name: "testuser", email: "test@test.com", password_digest: "$2a$10$dQ7BxYo5UdO1Vig2zwjbQ.drd965pyyodmZv8nGTyA8vq0VJcF6hW"}
])
Recipe.create!([
  {title: "Empty Sandwich", ingredients: "Two slices of bread", directions: "Place slices of bread next to each other.", image_url: "http://www.phoenixisstrategic.com/wp-content/uploads/2013/05/blog-empty-sandwich.jpg", prep_time: 72, user_id: 1},
  {title: "Licorice", ingredients: "Licorice", directions: "Buy licroice from store.", image_url: "http://cdn2.bigcommerce.com/server6200/aa739/product_images/uploaded_images/red-licorice.png?t=1398725710", prep_time: 120, user_id: 1},
  {title: "Mud Pie", ingredients: "Flour, water, mud.", directions: "Mix flour and water, add mud, bake at 350 degrees for 1 hour.", image_url: "http://cdn-image.myrecipes.com/sites/default/files/styles/300x300/public/image/recipes/sl/05/12/mocha-mud-pie-sl-257949-x.jpg?itok=_ChocANl", prep_time: 84, user_id: 1},
  {title: "Pizza", ingredients: "Flour, water, pepperoni, cheese", directions: "Mix flour and water, add cheese and pepperoni, shape as a heart, bake in oven on self-clean mode.", image_url: "http://twopizzapals.weebly.com/uploads/2/3/6/0/23602608/1338890_orig.jpg", prep_time: 455, user_id: 1},
  {title: "Iced Tea", ingredients: "Water, tea, ice", directions: "Put in fridge after brewing", image_url: "https://food.fnr.sndimg.com/content/dam/images/food/fullset/2011/6/3/1/FNM_070111-Centerfold-007_s4x3.jpg.rend.hgtvcom.616.462.suffix/1371597847872.jpeg", prep_time: 45, user_id: 1},
  {title: "Corn on the cob", ingredients: "Corn, cob", directions: "Place corn on the cob, grill for 20 minutes, enjoy!", image_url: "http://www.scientificamerican.com/sciam/cache/file/59C0122F-509C-4FEE-99A67FC20C50CEF1.jpg", prep_time: 22, user_id: 1},
  {title: "Raw Eggs", ingredients: "Chicken", directions: "Squeeze the chicken", image_url: "http://swansonhealthcenter.com/wp-content/uploads/2011/07/Egg.jpg", prep_time: 1, user_id: 3},
  {title: "Green beans with butter", ingredients: "Green beans, butter, garlic", directions: "Sautee in pan until tender", image_url: "https://images.media-allrecipes.com/userphotos/560x315/2432913.jpg", prep_time: 15, user_id: 4}
])

