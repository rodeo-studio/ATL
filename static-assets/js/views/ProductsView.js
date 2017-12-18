define([
  'underscore', 
  'backbone'
], function(_, Backbone){

  var ProductsView = Backbone.View.extend({
    initialize: function(options){
      this.template = _.template($('#productsViewTemplate').text());

      this.options = options;
    },

    load: function(strQueryType){
      var self = this;

      var strQuery = '{ shop { products(first: 100) { edges { node { id handle title variants(first: 100) { edges { node { id title price availableForSale } } } images(first: 1) { edges { node { id src } } } } } } } }';
      if (strQueryType != '') {
        strQuery = '{ shop { products(first: 100, query:"product_type:' + strQueryType + '") { edges { node { id handle title variants(first: 100) { edges { node { id title price availableForSale } } } images(first: 1) { edges { node { id src } } } } } } } }';
      }

      $.ajax({
        url: SHOPIFY_GRAPHQL_API,
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

      return this;
    }

  });

  return ProductsView;
});
