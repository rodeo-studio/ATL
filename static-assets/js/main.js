require.config({
  waitSeconds: 10,
  paths: {
    jquery: 'libs/jquery-2.1.4.min',
    Modernizr: 'libs/modernizr-custom',
    underscore: 'libs/underscore-min',
    backbone: 'libs/backbone-min',
    async: 'libs/async',
    bootstrap: 'libs/bootstrap.min',
    modernizr: 'libs/modernizr-custom'
  },
  shim: {
    'bootstrap' : {
      deps: ['jquery']
    }
  }
});

// Load our app module and pass it to our definition function
require(['controller/' + APP], function(App){
  App.initialize();
})
