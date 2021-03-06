var app = app || {};

var SLIDE_TIMER = 8000;

define([
  'underscore',
  'backbone',
  'bootstrap',
  'modernizr',
  'imageScale',
  'views/WeatherView',
  'views/HeroSlideView',
  'moment',
  'visible',
  'parallax',
  'macy',
  'slick',
  'sticky',
  'cookie',
  'views/ProductsView',
  'views/ProductView',
  'views/ProductsExploreView',
  'views/CartView',
], function(_, Backbone, bootstrap, modernizr, imageScale, WeatherView, HeroSlideView, moment, visible, parallax, Macy, slick, sticky, cookie, ProductsView, ProductView, ProductsExploreView, CartView){
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
    var productsView = null, productView = null, productsExploreView = null;

    app.dispatcher.on("WeatherView:loaded", onWeatherLoaded);

    app.dispatcher.on("HeroSlideView:ready", onHeroSlideViewReady);

    app.dispatcher.on("ProductsView:loaded", onProductsLoaded);

    app.dispatcher.on("ProductView:loaded", onProductLoaded);
    app.dispatcher.on("ProductView:addToCart", onProductAddToCart);

    app.dispatcher.on("ProductsExploreView:loaded", onProductsExploreLoaded);
    app.dispatcher.on("ProductsExploreView:addToCart", onProductAddToCart);

    app.dispatcher.on("CartView:created", onCartCreated);
    app.dispatcher.on("CartView:loaded", onCartLoaded);
    app.dispatcher.on("CartView:added", onCartItemAddedLoaded);
    app.dispatcher.on("CartView:updatedQty", onCartItemUpdatedQtyLoaded);
    app.dispatcher.on("CartView:updatedRemove", onCartItemUpdatedRemoveLoaded);
    app.dispatcher.on("CartView:updateCartItemQty", onUpdateCartItemQty);
    app.dispatcher.on("CartView:removeCartItem", onRemoveCartItem);

    function isBreakpoint( alias ) {
      return $('.device-' + alias).is(':visible');
    }

    function validateForm(elForm){
      var bValid = true;

      $('.form-group', elForm).removeClass('has-error');
      $('.help-block', elForm).hide();

      // manage errs
      $('.required', elForm).each(function(){
        if ($(this).val() == '') {
          bValid = false;
          var elParent = $(this).parent();
          elParent.addClass('has-error');
          $('.help-block', elParent).show();
          // highlight that there is at least 1 error
          var elFormErr = $('.form-error', elForm);
          if (elFormErr.length) {
            elFormErr.addClass('has-error');
            $('.help-block', elFormErr).show();
          }
        }
      });
      return bValid;
    }

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

    function checkInView() {
      var bVisible = false;
      $('.journal-view .journal-post').each(function(index){
        bVisible = $(this).visible(true);
        if (bVisible) {
          $(this).css('opacity', 1);
          $('.post-container', $(this)).css('top', 0);
        }
      });
    }

    function handleResize() {
      var nWindowHeight = Math.max(document.documentElement.clientHeight, window.innerHeight || 0);

      if (bFirstResize) {
        bFirstResize = false;

        nHeroHeight = nWindowHeight;
        $('.hero').css('height', nHeroHeight);
        $('.hero .strap').css('height', nHeroHeight);
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
      checkInView();

      if (productView) {
        // are we mobile size)
        if( isBreakpoint('xs') ) {
          productView.removeSticky();
        }
        else {
          productView.addSticky();
        }
      }
    }

    function onWeatherLoaded() {
      weatherView.render();
    }

    function onHeroSlideViewReady(elHeroSlide) {
    }

    function onProductsLoaded() {
      productsView.render();
      // for the parallax
      jQuery(window).trigger('resize').trigger('scroll');
    }

    function onProductAddToCart(productID, nQty) {
      var cartCookie = getCartCookie();
      if (cartCookie != undefined) {
        cartView.add(cartCookie, productID, nQty);
      }
    }

    function onProductLoaded() {
      productView.render();
    }

    function onProductsExploreLoaded() {
      productsExploreView.render();
    }

    function onCartCreated(cartID) {
      setCartCookie(cartID);
    }

    function onCartLoaded(jsonCart) {
      if ($('#cart-view').length) {
        cartView.render(jsonCart.data.checkoutLineItemsAdd, $('#cart-view'), $('#cartViewTemplate'));
      }
      if ($('#cart-detail-view').length) {
        cartView.render(jsonCart.data.checkoutLineItemsAdd, $('#cart-detail-view'), $('#cartDetailViewTemplate'));
      }
      // for the parallax
      jQuery(window).trigger('resize').trigger('scroll');
    }

    function onCartItemAddedLoaded(jsonCart) {
      if ($('#cart-view').length) {
        cartView.render(jsonCart.data.checkoutLineItemsAdd, $('#cart-view'), $('#cartViewTemplate'));
      }
      if ($('#cart-detail-view').length) {
        cartView.render(jsonCart.data.checkoutLineItemsAdd, $('#cart-detail-view'), $('#cartDetailViewTemplate'));
      }
    }

    function onCartItemUpdatedQtyLoaded(jsonCart) {
      if ($('#cart-view').length) {
        cartView.render(jsonCart.data.checkoutLineItemsUpdate, $('#cart-view'), $('#cartViewTemplate'));
      }
      if ($('#cart-detail-view').length) {
        cartView.render(jsonCart.data.checkoutLineItemsUpdate, $('#cart-detail-view'), $('#cartDetailViewTemplate'));
      }
    }

    function onCartItemUpdatedRemoveLoaded(jsonCart) {
      if ($('#cart-view').length) {
        cartView.render(jsonCart.data.checkoutLineItemsRemove, $('#cart-view'), $('#cartViewTemplate'));
      }
      if ($('#cart-detail-view').length) {
        cartView.render(jsonCart.data.checkoutLineItemsRemove, $('#cart-detail-view'), $('#cartDetailViewTemplate'));
      }
    }

    function onUpdateCartItemQty(cartID, productID, nQty) {
      cartView.update(cartID, productID, nQty);
    }

    function onRemoveCartItem(cartID, productID) {
      cartView.remove(cartID, productID);
    }

    // do we want to update header colour on scroll?
    if ($('body.header-colour-toggle').length) {
      $(window).scroll(function() {
        $('.top-logo .white').show();
        $('.top-logo .black').hide();
        $('.cart-menu').removeClass('dark');
        $('.main-menu').removeClass('dark');
        if ($(document).scrollTop() > (nHeroHeight - 50)) {
          $('.top-logo .black').show();
          $('.top-logo .white').hide();
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
      function selectType(elType) {
        $('.products-intro-view .link').removeClass('active');
        elType.addClass('active');
        productsView.load(elType.attr('data-id'));
      }

      productsView = new ProductsView({ el: '#products-view' });
      $('.products-intro-view .link').click(function(evt){
        selectType($(this));
      });
      // select All
      selectType($('.products-intro-view .link[data-id="All"]'));
    }

    if ($('#product-detail-view').length) {
      productView = new ProductView({ el: '#product-detail-view' });
      productView.load(PRODUCT_ID);
    }

    if ($('#products-explore-view').length) {
      productsExploreView = new ProductsExploreView({ el: '#products-explore-view', strCurrProductHandle: PRODUCT_ID });
      productsExploreView.load();
    }

    if ($('#macy-container').length) {
      var macyInstance = Macy({
        container: '#macy-container',
        columns: 1,
        waitForImages: true,
        mobileFirst: true,
        breakAt: {
          768: {
            columns: 2
          }
        }
      });

      macyInstance.on(macyInstance.constants.EVENT_IMAGE_COMPLETE, function (ctx) {
        checkInView();

        $(window).scroll(function() {
          checkInView();
        });
      });
    }

    var weatherView = new WeatherView({ el: '#weather-view', lat: -33.833570, lon: 138.610000 });
    weatherView.load();

    var cartView = new CartView();

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

    if ($('body').attr('data-block') != undefined) {
      var new_position = $('#'+$('body').attr('data-block')).offset();
      if (new_position != undefined) {
        window.scrollTo(new_position.left,new_position.top);
      }
    }

    $('.moment').each(function(){
      var strFormat = 'do MMMM YYYY';
      if ($(this).hasClass('day_month')) {
        strFormat = 'do MMMM'
      }
      if ($(this).hasClass('year')) {
        strFormat = 'YYYY'
      }
      $(this).html(moment($(this).html()).format(strFormat));
      $(this).show();
    });

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

    $('#signup').submit(function(evt){
      evt.preventDefault();
      
      $.post("server/mailerproxy.php", $('#signup').serialize()).success(function(data) {
        console.log(data);
      });

      $('#signup .thanks').hide();
      if (validateForm($('#signup'))) {
        $('#signup .thanks').show();
      }
    });

    // for the parallax
    jQuery(window).trigger('resize').trigger('scroll');
  };

  return { 
    initialize: initialize
  };
});

