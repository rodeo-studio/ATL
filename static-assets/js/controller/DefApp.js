var app = app || {};

var SLIDE_TIMER = 8000;

define([
  'underscore',
  'backbone',
  'bootstrap',
  'modernizr',
  'imageScale',
  'views/HeroSlideView',
  'parallax',
  'cookie',
  'views/ProductsView',
  'views/ProductView',
  'views/CartView'
], function(_, Backbone, bootstrap, modernizr, imageScale, HeroSlideView, parallax, cookie, ProductsView, ProductView, CartView){
  app.dispatcher = _.clone(Backbone.Events);

  _.templateSettings = {
      evaluate:    /\{\{(.+?)\}\}/g,
      interpolate: /\{\{=(.+?)\}\}/g,
      escape:      /\{\{-(.+?)\}\}/g
  };

  var initialize = function() {
    var self = this;
    var arrHeroSlides = new Array;
    var nCurrSlide = 0;
    var bFirstResize = true;
    var nHeroHeight = 0;
    var productsView = null, productView =null;

    app.dispatcher.on("HeroSlideView:ready", onHeroSlideViewReady);

    app.dispatcher.on("ProductsView:loaded", onProductsLoaded);

    app.dispatcher.on("ProductView:loaded", onProductLoaded);
    app.dispatcher.on("ProductView:addToCart", onProductAddToCart);

    app.dispatcher.on("CartView:created", onCartCreated);
    app.dispatcher.on("CartView:loaded", onCartLoaded);
    app.dispatcher.on("CartView:added", onCartItemAddedLoaded);
    app.dispatcher.on("CartView:updatedQty", onCartItemUpdatedQtyLoaded);
    app.dispatcher.on("CartView:updatedRemove", onCartItemUpdatedRemoveLoaded);
    app.dispatcher.on("CartView:updateCartItemQty", onUpdateCartItemQty);
    app.dispatcher.on("CartView:removeCartItem", onRemoveCartItem);

    function changeSlide() {
      arrHeroSlides[nCurrSlide].hide();

      if (nCurrSlide+1 < arrHeroSlides.length) {
        nCurrSlide++;
      }
      else {
        nCurrSlide = 0;
      }
      arrHeroSlides[nCurrSlide].show();
    }

    function initHeroSlides() {
      $('.hero-item').each(function(index){
        arrHeroSlides.push(new HeroSlideView({ el: $(this) }));
      });
      arrHeroSlides[nCurrSlide].show();

      setInterval(function(){
        changeSlide();
      }, SLIDE_TIMER);
    }

    function handleResize() {
      var nWindowHeight = Math.max(document.documentElement.clientHeight, window.innerHeight || 0);

      if (bFirstResize) {
        bFirstResize = false;

        nHeroHeight = nWindowHeight;
        $('.hero').css('height', nHeroHeight);
        $('.hero .strap').css('height', nHeroHeight);
        $('.hero .strap').css('line-height', nHeroHeight + 'px');
      }

      if ($('#menu-overlay').hasClass('open')) {
        // defined height + enough space to see some content underneath
        var nMenusHeight = 400 + 100;
        if (nWindowHeight < nMenusHeight) {
          nMenusHeight = nWindowHeight;
        }
        $('#menu-overlay').css('height', nMenusHeight);
      }
      else {
        $('#menu-overlay').css('height', 0);
      }
    }

    function onHeroSlideViewReady(elHeroSlide) {
      console.log('ready');
    }

    function onProductsLoaded() {
      productsView.render();
      // for the parallax
      jQuery(window).trigger('resize').trigger('scroll');
    }

    function onProductAddToCart(productID) {
      var cartCookie = getCartCookie();
      if (cartCookie != undefined) {
        cartView.add(cartCookie, productID, 1);
      }
    }

    function onProductLoaded() {
      productView.render();
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

    // do we want to update header colour on scroll?
    if ($('body.header-colour-toggle').length) {
      $(window).scroll(function() {
        $('.cart-menu').removeClass('dark');
        $('.main-menu').removeClass('dark');
        if ($(document).scrollTop() > (nHeroHeight - 50)) {
          $('.cart-menu').addClass('dark');
          $('.main-menu').addClass('dark');
        }
        handleResize();
      });
    }

    $(window).resize(function() {
      handleResize();
    });

    if ($('#products-view').length) {
      productsView = new ProductsView({ el: '#products-view' });
      productsView.load('');
//      productsView.load('White');
    }

    if ($('#product-detail-view').length) {
      console.log(PRODUCT_ID);
      productView = new ProductView({ el: '#product-detail-view' });
      productView.load(PRODUCT_ID);
    }

    var cartView = new CartView({ el: '#cart-view' });

    var cartCookie = getCartCookie();
    if (cartCookie != undefined) {
      // we have a cart
      cartView.load(cartCookie);
    }
    else {
      // no cart
      cartView.create();
    }

    $('.content').show();
    $('img.scale').imageScale({'rescaleOnResize': true});

    handleResize();

    if ($('.hero-container').length) {
      $('.hero-container').show();
      initHeroSlides();
    }

    $('img.scale').imageScale({
      'rescaleOnResize': true
    });

    $('.down').click(function(evt){
      $('html, body').animate({
        scrollTop: $("#content").offset().top
      }, 1000);
    });

    $('.top').click(function(evt){
      $('html, body').animate({
        scrollTop: $("#top").offset().top
      }, 1000);
    });

    $('#menu-btn').click(function(){
      $(this).toggleClass('open');
      $('#menu-overlay').toggleClass('open');

      handleResize();
    });

    $('.container-fluid').click(function(evt){
      $('#menu-btn').removeClass('open');
      $('#menu-overlay').removeClass('open');

      handleResize();
    });

    // for the parallax
    jQuery(window).trigger('resize').trigger('scroll');
  };

  return { 
    initialize: initialize
  };
});

