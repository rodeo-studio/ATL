var app = app || {};

define([
  'underscore',
  'backbone',
  'bootstrap',
  'modernizr'
], function(_, Backbone, bootstrap, modernizr){
  app.dispatcher = _.clone(Backbone.Events);

  _.templateSettings = {
      evaluate:    /\{\{(.+?)\}\}/g,
      interpolate: /\{\{=(.+?)\}\}/g,
      escape:      /\{\{-(.+?)\}\}/g
  };

  var initialize = function() {
    var self = this;

    function GetCart(strCheckoutID) {
      console.log('GetCart');

      var strQuery = 'mutation { checkoutLineItemsAdd(lineItems: [], checkoutId: "' + strCheckoutID + '" ) { checkout { id lineItems(first:2) { edges { node { id title quantity } } } } } }';
      $.ajax({
        url: 'https://rodeostore.myshopify.com/api/graphql',
        type: 'POST',
        datatype: 'json',
        data: strQuery,
        success: function(response) {
          console.log(response);
        },
        error: function(response) {
          console.log('ERR');
          console.log(response);
        },
        beforeSend: setHeader
      });
    }

    function AddToCart(strCheckoutID, strProductID) {
      console.log('AddToCart');

      var strQuery = 'mutation { checkoutLineItemsAdd(lineItems: [{ variantId: "' + strProductID + '", quantity: 1 }], checkoutId: "' + strCheckoutID + '" ) { checkout { id lineItems(first:2) { edges { node { id title quantity } } } } } }';
      $.ajax({
        url: 'https://rodeostore.myshopify.com/api/graphql',
        type: 'POST',
        datatype: 'json',
        data: strQuery,
        success: function(response) {
          console.log(response);
        },
        error: function(response) {
          console.log('ERR');
          console.log(response);
        },
        beforeSend: setHeader
      });
    }

    function CreateCart() {
      console.log('CreateCart');

      var strQuery = "mutation { checkoutCreate(input: {}) { checkout { id webUrl lineItems(first: 5) { edges { node { title quantity } } } } } }";
      $.ajax({
        url: 'https://rodeostore.myshopify.com/api/graphql',
        type: 'POST',
        datatype: 'json',
        data: strQuery,
        success: function(response) {
          console.log(response);
          console.log(response.data.checkoutCreate.checkout.id);
          AddToCart(response.data.checkoutCreate.checkout.id);
        },
        error: function(response) {
          console.log('ERR');
          console.log(response);
        },
        beforeSend: setHeader
      });

    }

    console.log('GetProducts');

    var strQuery = "{ shop { products(first: 10) { edges { node { id handle title variants(first: 10) { edges { node { id price } } } images(first: 1) { edges { node { id src } } } } } } } }";
    $.ajax({
      url: 'https://rodeostore.myshopify.com/api/graphql',
      type: 'POST',
      datatype: 'json',
      data: strQuery,
      success: function(response) {
        console.log(response.data.shop.products);

//        CreateCart();
        AddToCart("Z2lkOi8vc2hvcGlmeS9DaGVja291dC8yM2I1YmQ4M2NjZGI2NTc0NjliNTYwYjFmYzc1Y2EzMD9rZXk9Zjk3NzUyMmQyMjI4OWFhNGI1OWRkNmZiMDU4MzY5Yzc=", "Z2lkOi8vc2hvcGlmeS9Qcm9kdWN0VmFyaWFudC81MTA4NTQwNzAyNzU5");
        AddToCart("Z2lkOi8vc2hvcGlmeS9DaGVja291dC8yM2I1YmQ4M2NjZGI2NTc0NjliNTYwYjFmYzc1Y2EzMD9rZXk9Zjk3NzUyMmQyMjI4OWFhNGI1OWRkNmZiMDU4MzY5Yzc=", "Z2lkOi8vc2hvcGlmeS9Qcm9kdWN0VmFyaWFudC81MTEyMDQwMDk1Nzgz");

        GetCart("Z2lkOi8vc2hvcGlmeS9DaGVja291dC8yM2I1YmQ4M2NjZGI2NTc0NjliNTYwYjFmYzc1Y2EzMD9rZXk9Zjk3NzUyMmQyMjI4OWFhNGI1OWRkNmZiMDU4MzY5Yzc=");
      },
      error: function(response) {
        console.log('ERR');
        console.log(response);
      },
      beforeSend: setHeader
    });

    function setHeader(xhr) {
      xhr.setRequestHeader('Content-Type', 'application/graphql');
      xhr.setRequestHeader('X-Shopify-Storefront-Access-Token', 'e50032fdb73536e1e5765985c40edca6');
    }

  };

  return { 
    initialize: initialize
  };
});

