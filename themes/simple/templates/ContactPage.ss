<!DOCTYPE html>
<html>
<head>
<% base_tag %>
<% include GetIncludes %>
<link href='static-assets/css/contact.css' rel='stylesheet' />
</head>

<body class="header-colour-toggle">
<% include DisplayAnalytics %>
<script>
var APP = 'DefApp';
</script>

<div id="top" class="about-view">
  <div class="container-fluid nopadding">
    <div class="hero">
      <div class="hero-container">
        <div class="hero-carousel">
          <div class="hero-item image_container fade_on_load">
          <% if HeroImage %>
            <img class="scale" src="{$HeroImage.URL}">
          <% end_if %>
          </div>
        </div>
        <div class="strap">{$MenuTitle}</div>
        <div class="down"><img src="static-assets/images/down_arrow_white.svg"></div>
      </div>
    </div>

    <div id="content" class="content clearfix">
      <div class="contact-detail-view">
        <div class="contact-block clearfix">
          <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12 nopadding">
            <div class="title"><h1>ATLAS WINES</h1></div>
          </div>
          <div class="col-lg-7 col-md-7 col-sm-7 col-xs-12 nopadding">
            <div class="text">$MainContactInfo</div>
          </div>
        </div>
        <div class="contact-block clearfix">
          <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12 nopadding">
            <div class="title"><h1>INTERESTED IN STOCKING ATLAS WINES?</h1></div>
          </div>
          <div class="col-lg-7 col-md-7 col-sm-7 col-xs-12 nopadding">
            <div class="text">$StockingContactInfo</div>
          </div>
        </div>
        <div class="contact-block clearfix">
          <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12 nopadding">
            <div class="title"><h1>FOR MEDIA AND GENERAL ENQUIRIES</h1></div>
          </div>
          <div class="col-lg-7 col-md-7 col-sm-7 col-xs-12 nopadding">
            <div class="text">$MediaContactInfo</div>
          </div>
        </div>
      </div>

      <% include DisplayBaseImage %>

      <% include DisplayPageExtraHighlights %>

      <% include DisplayFooter %>
    </div>
  </div>

  <% include DisplayMainMenu %>
</div>
</body>
<script data-main="static-assets/js/main" src="static-assets/js/libs/require.min.js"></script>
</html>