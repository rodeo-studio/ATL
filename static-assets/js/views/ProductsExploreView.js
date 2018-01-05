define([
  'underscore', 
  'backbone'
], function(_, Backbone){

  var ProductsExploreView = Backbone.View.extend({
    initialize: function(options){
      this.template = _.template($('#productsExploreViewTemplate').text());

      this.options = options;
    },

    load: function(){
      var self = this;

      var strQuery = '{ shop { products(first: 100) { edges { node { id handle title variants(first: 100) { edges { node { id title price availableForSale } } } images(first: 1) { edges { node { id src } } } } } } } }';

      $.ajax({
        url: SHOPIFY_GRAPHQL_API,
        type: 'POST',
        datatype: 'json',
        data: strQuery,
        success: function(response) {
          self.products = response.data.shop.products;
          // fire event
          app.dispatcher.trigger("ProductsExploreView:loaded", self);
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

      self.products.currProductHandle = this.options.strCurrProductHandle;
      $(this.el).html(this.template({ products: self.products }));

      $('.next-arrow', $(this.el)).click(function(evt){
        $('.products', $(self.el)).slick('slickNext');
      });

      $('.prev-arrow', $(this.el)).click(function(evt){
        $('.products', $(self.el)).slick('slickPrev');
      });

      $('.btn-add-to-cart', $(this.el)).click(function(evt){
        // fire event
        app.dispatcher.trigger("ProductsExploreView:addToCart", $(this).attr('data-id'), 1);
      });

      $('.products', $(this.el)).slick({
        arrows: false,
        dots: false,
        infinite: true,
        speed: 300,
        slidesToShow: 3,
        slidesToScroll: 1,
        responsive: [
          {
            breakpoint: 768,
            settings: {
              slidesToShow: 1,
              slidesToScroll: 1
            }
          }
        ]
      });
      
      return this;
    }

  });

  return ProductsExploreView;
});
