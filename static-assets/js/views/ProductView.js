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

      var strQuery = '{ shop { productByHandle(handle: "' + strProductHandle + '") { id handle title descriptionHtml variants(first: 10) { edges { node { id title price availableForSale } } } images(first: 1) { edges { node { id src } } } } } }';
      $.ajax({
        url: SHOPIFY_GRAPHQL_API,
        type: 'POST',
        datatype: 'json',
        data: strQuery,
        success: function(response) {
          self.product = response.data.shop.productByHandle;
          console.log(self.product);
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

      $(this.el).html(this.template(self.product));

      var elQty = $('.qty', $(this).el);
      var nMinQty = Number(elQty.attr('data-min-qty'));
      var nQtyInc = Number(elQty.attr('data-qty-inc'));

      $('.back-link', $(this).el).click(function(evt){
        window.history.back();
      });

      $('.btn-add-to-cart', $(this).el).click(function(evt){
        var nQty = Number(elQty.attr('data-qty'));

        // fire event
        app.dispatcher.trigger("ProductView:addToCart", $(this).attr('data-id'), nQty);
      });

      $('.btn-qty.btn-less', $(this).el).click(function(evt){
        var nQty = Number(elQty.attr('data-qty'));

        if (nQty > nMinQty) {
          nQty -= nQtyInc;
          elQty.attr('data-qty', nQty);
          elQty.html(nQty);
        }
      });

      $('.btn-qty.btn-more', $(this).el).click(function(evt){
        var nQty = Number(elQty.attr('data-qty'));

        nQty += nQtyInc;
        elQty.attr('data-qty', nQty);
        elQty.html(nQty);
      });

      return this;
    }

  });

  return ProductView;
});
