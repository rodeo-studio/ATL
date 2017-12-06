define([
  'underscore', 
  'backbone'
], function(_, Backbone){

  var ProductView = Backbone.View.extend({
    initialize: function(options){
      this.template = _.template($('#productViewTemplate').text());

      this.options = options;
    },

    load: function(strProductHandle){
      var self = this;

      var strQuery = '{ shop { productByHandle(handle: "' + strProductHandle + '") { id handle title descriptionHtml variants(first: 10) { edges { node { id price availableForSale } } } images(first: 1) { edges { node { id src } } } } } }';
      $.ajax({
        url: SHOPIFY_GRAPHQL_API,
        type: 'POST',
        datatype: 'json',
        data: strQuery,
        success: function(response) {
          self.product = response.data.shop.productByHandle;
          // fire event
          app.dispatcher.trigger("ProductView:loaded", self);
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

      console.log(self.product);
      $(this.el).html(this.template(self.product));

      $('.btn-add-to-cart', $(this).el).click(function(evt){
        // fire event
        app.dispatcher.trigger("ProductView:addToCart", $(this).attr('data-id'));
      });

      return this;
    }

  });

  return ProductView;
});
