var COOKIE_PREFIX = 'atlaswine_';

require.config({
  waitSeconds: 10,
  paths: {
    jquery: 'libs/jquery-2.1.4.min',
    Modernizr: 'libs/modernizr-custom',
    underscore: 'libs/underscore-min',
    backbone: 'libs/backbone-min',
    async: 'libs/async',
    bootstrap: 'libs/bootstrap.min',
    modernizr: 'libs/modernizr-custom',
    cookie: 'libs/js.cookie'
  },
  shim: {
    'bootstrap' : {
      deps: ['jquery']
    },
    'cookie' : {
      deps: ['jquery']
    }
  }
});

function setShopifyHeader(xhr) {
  xhr.setRequestHeader('Content-Type', 'application/graphql');
  xhr.setRequestHeader('X-Shopify-Storefront-Access-Token', 'e50032fdb73536e1e5765985c40edca6');
}

function setCartCookie(token){
  removeCartCookie();
  
  $.cookie(COOKIE_PREFIX + 'carttoken', token, { expires: 365, path: '/' });
}

function removeCartCookie(){
  $.removeCookie(COOKIE_PREFIX + 'carttoken', { path: '/' });
}

function getCartCookie(){
  return $.cookie(COOKIE_PREFIX + 'carttoken');
}

// Load our app module and pass it to our definition function
require(['controller/' + APP], function(App){
  App.initialize();
})
