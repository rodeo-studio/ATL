var app = app || {};

define([
  'underscore',
  'backbone',
  'bootstrap',
  'modernizr',
  'cookie',
  'views/ProductsView',
  'views/CartView'
], function(_, Backbone, bootstrap, modernizr, cookie, ProductsView, CartView){
  app.dispatcher = _.clone(Backbone.Events);

  _.templateSettings = {
      evaluate:    /\{\{(.+?)\}\}/g,
      interpolate: /\{\{=(.+?)\}\}/g,
      escape:      /\{\{-(.+?)\}\}/g
  };

  var initialize = function() {
    var self = this;

    app.dispatcher.on("ProductsView:loaded", onProductsLoaded);
    app.dispatcher.on("ProductsView:addToCart", onProductAddToCart);

    app.dispatcher.on("CartView:created", onCartCreated);
    app.dispatcher.on("CartView:loaded", onCartLoaded);
    app.dispatcher.on("CartView:added", onCartItemAddedLoaded);
    app.dispatcher.on("CartView:updatedQty", onCartItemUpdatedQtyLoaded);
    app.dispatcher.on("CartView:updatedRemove", onCartItemUpdatedRemoveLoaded);
    app.dispatcher.on("CartView:updateCartItemQty", onUpdateCartItemQty);
    app.dispatcher.on("CartView:removeCartItem", onRemoveCartItem);

    var productsView = new ProductsView({ el: '#products-view' });
    productsView.load();

    var cartView = new CartView({ el: '#cart-view' });

    var cartCookie = getCartCookie();
    console.log(cartCookie);
    if (cartCookie != undefined) {
      // we have a cart
      cartView.load(cartCookie);
    }
    else {
      // no cart
      cartView.create();
    }

    function onProductsLoaded() {
      productsView.render();
    }

    function onProductAddToCart(productID) {
      var cartCookie = getCartCookie();
      if (cartCookie != undefined) {
        cartView.add(cartCookie, productID, 1);
      }
    }

    function onCartCreated(cartID) {
      setCartCookie(cartID);
    }

    function onCartLoaded(jsonCart) {
      cartView.render(jsonCart.data.checkoutLineItemsAdd);
    }

    function onCartItemAddedLoaded(jsonCart) {
      cartView.render(jsonCart.data.checkoutLineItemsAdd);
    }

    function onCartItemUpdatedQtyLoaded(jsonCart) {
      cartView.render(jsonCart.data.checkoutLineItemsUpdate);
    }

    function onCartItemUpdatedRemoveLoaded(jsonCart) {
      cartView.render(jsonCart.data.checkoutLineItemsRemove);
    }

    function onUpdateCartItemQty(cartID, productID) {
      cartView.update(cartID, productID, 10);
    }

    function onRemoveCartItem(cartID, productID) {
      cartView.remove(cartID, productID);
    }

  };

  return { 
    initialize: initialize
  };
});

