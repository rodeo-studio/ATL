<!DOCTYPE html>
<html>
<head>
<% base_tag %>
<% include GetIncludes %>
<link href='static-assets/css/vineyards.css' rel='stylesheet' />
</head>

<body class="header-colour-toggle">
<script>
var APP = 'DefApp';
var LOCATION_FRIENDLY_TIME = '$LocationFriendlyTime';
</script>

<div id="top" class="vineyards-view">
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
        <div class="strap">Vineyards<br/>&amp; Growers</div>
        <div class="down"><img src="static-assets/images/down_arrow_white.svg"></div>
      </div>
    </div>

    <div id="content" class="content clearfix">
      <div class="vineyards-detail-view">$Intro</div>
      <% loop VineyardElements %>
        <% if Even %>
        <div class="vineyard-view">
        <% else %>
        <div class="vineyard-view dark-background">
        <% end_if %>
          <a name="{$Anchor}"></a>
          <div class="title">
            <div class="break light"></div>
            <h1>$Title</h1>
            <div class="break light"></div>
          </div>
          <div class="text-view">
            <div class="intro">
              <div class="grower">GROWER — {$Grower}</div>
              <div class="location">LOCATION — {$Location}</div>
              <div>DESCRIPTION</div>
            </div>
            $Content
          </div>
          <% if HeroImage %>
            <div class="vineyard-photo-view">
              <div class="image"><img src="{$HeroImage.URL}"></div>
            </div>
          <% end_if %>
        </div>
      <% end_loop %>

      <% include DisplayBaseImage %>

      <% include DisplayPageExtraHighlights %>

      <% include DisplayFooter %>
    </div>
  </div>

  <% include DisplayMainMenu %>
</div>

<% include DisplayAnalytics %>
</body>
<script data-main="static-assets/js/main" src="static-assets/js/libs/require.min.js"></script>
</html>