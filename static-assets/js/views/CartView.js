var DEFAULT_SHOPIFY_VARIANT_TITLE = 'Default Title';
var MINIMUM_ITEM_QTY = 6;

define([
  'underscore', 
  'backbone'
], function(_, Backbone){

  var CartView = Backbone.View.extend({
    initialize: function(options){
      this.options = options;
    },

    create: function(){
      var self = this;

      var strQuery = "mutation { checkoutCreate(input: {}) { checkout { id subtotalPrice webUrl lineItems(first: 100) { edges { node { title quantity variant { title price } } } } } } }";
      $.ajax({
        url: SHOPIFY_GRAPHQL_API,
        type: 'POST',
        datatype: 'json',
        data: strQuery,
        success: function(response) {
          // fire event
          app.dispatcher.trigger("CartView:created", response.data.checkoutCreate.checkout.id);
        },
        error: function(response) {
          console.log('ERR');
          console.log(response);
        },
        beforeSend: setShopifyHeader
      });
    },

    load: function(cartID){
      var self = this;

      var strQuery = 'mutation { checkoutLineItemsAdd(lineItems: [], checkoutId: "' + cartID + '" ) { checkout { id subtotalPrice webUrl lineItems(first: 100) { edges { node { id title quantity variant { title price } } } } } } }';
      $.ajax({
        url: SHOPIFY_GRAPHQL_API,
        type: 'POST',
        datatype: 'json',
        data: strQuery,
        success: function(response) {
          // fire event
          app.dispatcher.trigger("CartView:loaded", response);
        },
        error: function(response) {
          console.log('ERR');
          console.log(response);
        },
        beforeSend: setShopifyHeader
      });
    },

    add: function(cartID, productID, nQty){
      var strQuery = 'mutation { checkoutLineItemsAdd(lineItems: [{ variantId: "' + productID + '", quantity: ' + nQty + ' }], checkoutId: "' + cartID + '" ) { checkout { id subtotalPrice webUrl lineItems(first: 100) { edges { node { id title quantity variant { title price } } } } } } }';
      $.ajax({
        url: SHOPIFY_GRAPHQL_API,
        type: 'POST',
        datatype: 'json',
        data: strQuery,
        success: function(response) {
          // fire event
          app.dispatcher.trigger("CartView:added", response);
        },
        error: function(response) {
          console.log('ERR');
          console.log(response);
        },
        beforeSend: setShopifyHeader
      });
    },

    update: function(cartID, productID, nQty){
      var strQuery = 'mutation { checkoutLineItemsUpdate(lineItems: [{ id: "' + productID + '", quantity: ' + nQty + ' }], checkoutId: "' + cartID + '" ) { checkout { id subtotalPrice webUrl lineItems(first: 100) { edges { node { id title quantity variant { title price } } } } } } }';
      $.ajax({
        url: SHOPIFY_GRAPHQL_API,
        type: 'POST',
        datatype: 'json',
        data: strQuery,
        success: function(response) {
          // fire event
          app.dispatcher.trigger("CartView:updatedQty", response);
        },
        error: function(response) {
          console.log('ERR');
          console.log(response);
        },
        beforeSend: setShopifyHeader
      });
    },

    remove: function(cartID, productID){
      var strQuery = 'mutation { checkoutLineItemsRemove(lineItemIds: ["' + productID + '"], checkoutId: "' + cartID + '" ) { checkout { id subtotalPrice webUrl lineItems(first: 100) { edges { node { id title quantity variant { title price } } } } } } }';
      $.ajax({
        url: SHOPIFY_GRAPHQL_API,
        type: 'POST',
        datatype: 'json',
        data: strQuery,
        success: function(response) {
          // fire event
          app.dispatcher.trigger("CartView:updatedRemove", response);
        },
        error: function(response) {
          console.log('ERR');
          console.log(response);
        },
        beforeSend: setShopifyHeader
      });
    },

    render: function(jsonCart, elContainer, elTemplate){
      var template = _.template(elTemplate.text());

      var self = this;

      // store total qty and check cart is valid
      var bCartValid = true, nQty = 0;
      $.each(jsonCart.checkout.lineItems.edges, function(key, item){
        item.valid = true;
        nQty += item.node.quantity;
        // is this item valid?
        if (item.node.variant.title == DEFAULT_SHOPIFY_VARIANT_TITLE && item.node.quantity < MINIMUM_ITEM_QTY) {
          bCartValid = false;
          item.valid = false;
        }
      });

      // only show if we have something in the cart
      if (nQty) {
        elContainer.show();
      }
      else {
        bCartValid = false;
      }

      elContainer.html(template({ cart: jsonCart, cartQty: nQty, cartValid: bCartValid }));

      $('.item .btn-increment-cart-item-qty', elContainer).click(function(evt){
        // get cart
        var elCart = $(this).closest('.cart');
        // get qty
        var elQtySelector = $(this).closest('.qty-selector');
        var nQty = Number($('.qty', elQtySelector).html()) + 1;

        // fire event
        app.dispatcher.trigger("CartView:updateCartItemQty", elCart.attr('data-id'), $(this).attr('data-id'), nQty);
      });

      $('.item .btn-decrement-cart-item-qty', elContainer).click(function(evt){
        // get cart
        var elCart = $(this).closest('.cart');
        // get qty
        var elQtySelector = $(this).closest('.qty-selector');
        var nQty = Number($('.qty', elQtySelector).html()) - 1;
        if (nQty >= 1) {
          // fire event
          app.dispatcher.trigger("CartView:updateCartItemQty", elCart.attr('data-id'), $(this).attr('data-id'), nQty);
        }
      });

      $('.item .btn-update-cart-item-qty', $(this).el).click(function(evt){
        // get cart
        var elCart = $(this).closest('.cart');
        // fire event
        app.dispatcher.trigger("CartView:updateCartItemQty", elCart.attr('data-id'), $(this).attr('data-id'), 5);
      });

      $('.item .btn-remove-cart-item', $(this).el).click(function(evt){
        // get cart
        var elCart = $(this).closest('.cart');
        // fire event
        app.dispatcher.trigger("CartView:removeCartItem", elCart.attr('data-id'), $(this).attr('data-id'));
      });

      return this;
    }

  });

  return CartView;
});
