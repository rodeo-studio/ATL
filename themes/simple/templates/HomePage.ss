<!DOCTYPE html>
<html>
<head>
<% base_tag %>
<% include GetIncludes %>
<link href='static-assets/css/home.css' rel='stylesheet' />
</head>

<body class="header-colour-toggle">
<script>
var APP = 'DefApp';
</script>

<div id="top" class="home-view">
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
        <div class="strap">
          <div class="logo"><img src="static-assets/images/logo.png"></div>
        </div>
        <div class="down"><img src="static-assets/images/down_arrow_white.svg"></div>
      </div>
    </div>

    <div id="content" class="content clearfix">
      <% include DisplayPageHighlights %>

      <% if Quote %>
        <div class="quote-view clearfix">
          <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 nopadding">$Quote</div>
        </div>
      <% end_if %>

      <% include DisplayBaseImage %>

      <% include DisplayPageExtraHighlights %>

      <div class="warning-view clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 nopadding">
          <div class="element-container">
            <div class="title">Warning</div>
            <div class="text">
            Under the Liquor Control Reform Act 1998 it is an offence: to supply alcohol to a person under the age of 18 years (Penalty exceeds $8,000); for a person under the age of 18 years to purchase or receive liquor (Penalty exceeds $700). Liquor Licence #36128660.  
            </div>
          </div>
        </div>
      </div>

      <% include DisplayFooter %>
    </div>
  </div>

  <% include DisplayMainMenu %>
</div>

<% include DisplayAnalytics %>
</body>
<script data-main="static-assets/js/main" src="static-assets/js/libs/require.min.js"></script>
</html>