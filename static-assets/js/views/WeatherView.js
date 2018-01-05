define([
  'underscore', 
  'backbone'
], function(_, Backbone){

  var WEATHER_BASEURL = 'http://api.openweathermap.org/data/2.5/weather';
  var WEATHER_APPID = 'ebd0689d6c9224dd829e3624ec18181d';
  var UNITS_METRIC = 0;

  var WeatherView = Backbone.View.extend({
    initialize: function(){
      this.template = _.template($('#weatherViewTemplate').text());

      this.jsonData = null;
      this.nUnits = UNITS_METRIC;  
    },

    load: function(){
      var self = this;

      var strURL = WEATHER_BASEURL + '?appid=' + WEATHER_APPID + '&lat='+self.options.lat+'&lon='+self.options.lon+'&units=metric';
      $.ajax({
        dataType: "jsonp",
        url: strURL,
        success: function(data) {
          self.jsonData = data;
          // fire event
          app.dispatcher.trigger("WeatherView:loaded", self);

        },
        error: function(data) {
          console.log('ERR');
        }
      });
    },

    render: function(){
      // icon
      var strText = 'day-cloudy';
      switch (this.jsonData['weather'][0].icon) {
        case '01d':
        case '01n':
          strText = 'day-sunny';
          break;

        case '02d':
        case '02n':
          strText = 'day-cloudy';
          break;

        case '03d':
        case '03n':
        case '04d':
        case '04n':
          strText = 'cloud';
          break;

        case '09d':
        case '09n':
          strText = 'day_rain';
          break;

        case '10d':
        case '10n':
          strText = 'rain';
          break;

        case '11d':
        case '11n':
          strText = 'storm-showers';
          break;

        case '13d':
        case '13n':
          strText = 'snow';
          break;

        case '50d':
        case '50n':
          strText = 'day_fog';
          break;
      }

      $(this.el).html(this.template({ weather: this.jsonData, weatherType: strText }));

      return this;
    }
  });

  return WeatherView;
});
