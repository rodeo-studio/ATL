define([
  'underscore', 
  'backbone',
  'imagesLoaded'
], function(_, Backbone, imagesLoaded){

  var HeroSlideView = Backbone.View.extend({
    initialize: function(options){
      this.options = options;

      var self = this;

      var elImages = $(this.el);
      var imgLoad = imagesLoaded(elImages);
      imgLoad.on('always', function(instance) {
        for ( var i = 0, len = imgLoad.images.length; i < len; i++ ) {
          if ($(imgLoad.images[i].img).hasClass('scale')) {
            $(imgLoad.images[i].img).addClass('scale_image_ready');
          }
        }
        // fire event
        app.dispatcher.trigger("HeroSlideView:ready", self);
      });
    },

    show: function() {
      $('img.scale', $(this.el)).imageScale({
        'rescaleOnResize': true
      });
      $(this.el).css('opacity', 1);
    },

    hide: function() {
      $(this.el).css('opacity', 0);
    },

    render: function(){
      return this;
    }

  });

  return HeroSlideView;
});
