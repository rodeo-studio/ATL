define([
  'underscore', 
  'backbone'
], function(_, Backbone){

  var ProductsView = Backbone.View.extend({
    initialize: function(options){
      this.template = _.template($('#productsViewTemplate').text());

      this.options = options;
    },

    load: function(){
      var self = this;

      var strQuery = "{ shop { products(first: 10) { edges { node { id handle title variants(first: 10) { edges { node { id price } } } images(first: 1) { edges { node { id src } } } } } } } }";
      $.ajax({
        url: 'https://rodeostore.myshopify.com/api/graphql',
        type: 'POST',
        datatype: 'json',
        data: strQuery,
        success: function(response) {
          self.products = response.data.shop.products;
          // fire event
          app.dispatcher.trigger("ProductsView:loaded", self);
        },
        error: function(response) {
          console.log('ERR');
          console.log(response);
        },
        beforeSend: setShopifyHeader
      });


    },

    render: function(){
      var self = this;

      $(this.el).html(this.template({ products: self.products }));

      $('.product .btn-add-to-cart', $(this).el).click(function(evt){
        // fire event
        app.dispatcher.trigger("ProductsView:addToCart", $(this).attr('data-id'));
      });

      return this;
    }

  });

  return ProductsView;
});