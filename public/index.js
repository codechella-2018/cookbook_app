/* global Vue, VueRouter, axios */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      recipes: [],
      currentRecipe: {}
    };
  },
  created: function() {
  	axios.get("/api/recipes").then(function(response){
  		this.recipes = response.data;
  		console.log(this.recipes);
  	}.bind(this));
  },
  methods: {
    setCurrentRecipe: function(recipe) {
      this.currentRecipe = recipe;
      console.log(this.currentRecipe);
    }
  },
  computed: {}
};

var SamplePage = {
  template: "#sample-page",
  data: function() {
    return {
      message: "Welcome to the sample page"
    };
  },
  created: function() {},
  methods: {},
  computed: {}
};

var SignupPage = {
  template: "#signup-page",
  data: function() {
    return {
      name: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation
      };
      axios
        .post("/users", params)
        .then(function(response) {
          router.push("/login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var LoginPage = {
  template: "#login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        auth: { email: this.email, password: this.password }
      };
      axios
        .post("/user_token", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};

var LogoutPage = {
  template: "<h1>Logout</h1>",
  created: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("jwt");
    router.push("/");
  }
};

var RecipesNewPage = {
  template: "#recipes-new-page",
  data: function() {
    return {
      title: "",
      ingredients: "",
      directions: "",
      prepTime: "",
      imageUrl: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        title: this.title,
        image_url: this.imageUrl,
        ingredients: this.ingredients,
        directions: this.directions,
        prep_time: this.prepTime
      };
      axios
        .post("/api/recipes", params)
        .then(function(response) {
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var RecipesShowPage = {
  template: "#recipes-show-page",
  data: function() {
    return {
      recipe: {}
    };
  },
  created: function() {
    axios.get("/api/recipes/" + this.$route.params.id).then(function(response){
      this.recipe = response.data;
      console.log(this.recipe);
    }.bind(this));
  },
  methods: {},
  computed: {}
};

var RecipesEditPage = {
  template: "#recipes-edit-page",
  data: function() {
    return {
      title: "",
      ingredients: "",
      directions: "",
      prepTime: "",
      imageUrl: "",
      errors: []
    };
  },
  created: function() {
    $('#exampleModal').modal('hide');
    axios.get("/api/recipes/" + this.$route.params.id).then(function(response){
      this.title = response.data.title;
      this.ingredients = response.data.ingredients;
      this.directions = response.data.directions;
      this.prepTime = response.data.prep_time;
      this.imageUrl = response.data.image_url;
    }.bind(this));
  },
  methods: {
    submit: function() {
      var params = {
        title: this.title,
        image_url: this.imageUrl,
        ingredients: this.ingredients,
        directions: this.directions,
        prep_time: this.prepTime
      };
      axios
        .patch("/api/recipes/" + this.$route.params.id, params)
        .then(function(response) {
          router.push("/recipes/" + this.$route.params.id);
        }.bind(this))
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};



var router = new VueRouter({
  routes: [
  	{ path: "/", component: HomePage }, 
  	{ path: "/sample", component: SamplePage},
  	{ path: "/signup", component: SignupPage },
  	{ path: "/login", component: LoginPage },
  	{ path: "/logout", component: LogoutPage },
    { path: "/recipes/new", component: RecipesNewPage },
    { path: "/recipes/:id", component: RecipesShowPage },
  	{ path: "/recipes/:id/edit", component: RecipesEditPage },
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router,
  created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
});























