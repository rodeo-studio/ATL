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
        url: 'https://rodeostore.myshopify.com/api/graphql',
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

      var strQuery = 'mutation { checkoutLineItemsAdd(lineItems: [], checkoutId: "' + cartID + '" ) { checkout { id lineItems(first:2) { edges { node { id title quantity } } } } } }';
      $.ajax({
        url: 'https://rodeostore.myshopify.com/api/graphql',
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

    add: function(cartID, productID){
      var strQuery = 'mutation { checkoutLineItemsAdd(lineItems: [{ variantId: "' + productID + '", quantity: 1 }], checkoutId: "' + cartID + '" ) { checkout { id lineItems(first:2) { edges { node { id title quantity } } } } } }';
      $.ajax({
        url: 'https://rodeostore.myshopify.com/api/graphql',
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

    render: function(jsonCart){
      var self = this;

      $(this.el).html(this.template({ cart: jsonCart }));

      return this;
    }

  });

  return CartView;
});
