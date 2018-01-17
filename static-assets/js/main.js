var COOKIE_PREFIX = 'atlaswine_';
var SHOPIFY_ACCESS_TOKEN = '80f6ea0c1446bd06a9f99dcd7400f467';
var SHOPIFY_GRAPHQL_API = 'https://atlas-wines.myshopify.com/api/graphql';

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
    moment: 'https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min',
    imageScale: 'libs/image-scale.min',
    imagesLoaded: 'https://cdnjs.cloudflare.com/ajax/libs/jquery.imagesloaded/4.1.2/imagesloaded.pkgd.min',
    visible: 'libs/jquery.visible.min',
    parallax: 'libs/parallax.min',
    macy: 'libs/macy',
    slick: 'https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min',
    sticky: 'libs/jquery.sticky-kit.min',
    cookie: 'libs/js.cookie'
  },
  shim: {
    'bootstrap' : {
      deps: ['jquery']
    },
    'imageScale': {
      deps: ['jquery'],
      exports: 'imageScale'
    },
    'imagesLoaded': {
      deps: ['jquery'],
      exports: 'imagesLoaded'
    },
    'visible' : {
      deps: ['jquery']
    },
    'parallax' : {
      deps: ['jquery']
    },
    'sticky' : {
      deps: ['jquery']
    },
    'cookie' : {
      deps: ['jquery']
    }
  }
});

function setShopifyHeader(xhr) {
  xhr.setRequestHeader('Content-Type', 'application/graphql');
  xhr.setRequestHeader('X-Shopify-Storefront-Access-Token', SHOPIFY_ACCESS_TOKEN);
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
