define([
  'underscore', 
  'backbone'
], function(_, Backbone){

  var CartView = Backbone.View.extend({
    initialize: function(options){
      this.template = _.template($('#cartViewTemplate').text());

      this.options = options;
    },

    create: function(){
      var self = this;

      var strQuery = "mutation { checkoutCreate(input: {}) { checkout { id webUrl lineItems(first: 5) { edges { node { title quantity } } } } } }";
      $.ajax({
        url: SHOPIFY_GRAPHQL_API,
        type: 'POST',
        datatype: 'json',
        data: strQuery,
        success: function(response) {
          console.log(response);
          console.log(response.data.checkoutCreate.checkout.id);

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

      var strQuery = 'mutation { checkoutLineItemsAdd(lineItems: [], checkoutId: "' + cartID + '" ) { checkout { id webUrl lineItems(first: 5) { edges { node { id title quantity } } } } } }';
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
      var strQuery = 'mutation { checkoutLineItemsAdd(lineItems: [{ variantId: "' + productID + '", quantity: ' + nQty + ' }], checkoutId: "' + cartID + '" ) { checkout { id webUrl lineItems(first:2) { edges { node { id title quantity } } } } } }';
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
      var strQuery = 'mutation { checkoutLineItemsUpdate(lineItems: [{ id: "' + productID + '", quantity: ' + nQty + ' }], checkoutId: "' + cartID + '" ) { checkout { id webUrl lineItems(first:2) { edges { node { id title quantity } } } } } }';
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
      var strQuery = 'mutation { checkoutLineItemsRemove(lineItemIds: ["' + productID + '"], checkoutId: "' + cartID + '" ) { checkout { id webUrl lineItems(first:2) { edges { node { id title quantity } } } } } }';
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

    render: function(jsonCart){
      var self = this;

      // store total qty
      var nQty = 0;
      $.each(jsonCart.checkout.lineItems.edges, function(key, item){
        nQty += item.node.quantity;
      });

      // only show if we have something in the cart
      if (nQty) {
        $(this.el).show();
      }

      $(this.el).html(this.template({ cart: jsonCart, cartQty: nQty }));

      $('.item .btn-update-cart-item-qty', $(this).el).click(function(evt){
        // get cart
        var elCart = $(this).closest('.cart');
        // fire event
        app.dispatcher.trigger("CartView:updateCartItemQty", elCart.attr('data-id'), $(this).attr('data-id'));
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
