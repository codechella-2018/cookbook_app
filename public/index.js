/* global Vue, VueRouter, axios */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      recipes: []
    };
  },
  created: function() {
  	axios.get("/api/recipes").then(function(response){
  		this.recipes = response.data;
  		console.log(this.recipes);
  	}.bind(this));
  },
  methods: {},
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

var router = new VueRouter({
  routes: [
  	{ path: "/", component: HomePage }, 
  	{ path: "/sample", component: SamplePage}
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router
});