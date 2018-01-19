<!DOCTYPE html>
<html>
<head>
<% base_tag %>
<% include GetIncludes %>
<link href='static-assets/css/about.css' rel='stylesheet' />
</head>

<body class="header-colour-toggle">
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
      <div class="about-detail-view">
        <% loop AboutElements %>
          <% if Type = 0 %>
            <% if BackgroundColour = 1 %>
            <div class="about-text-view dark-background">
            <% else %>
            <div class="about-text-view">
            <% end_if %>
              <div class="text-container text-cols">$Content</div>
            </div>
          <% else_if Type = 1 %>
            <% if BackgroundColour = 1 %>
            <div class="quote-view dark-background">
            <% else %>
            <div class="quote-view">
            <% end_if %>
              “{$Quote}”
              <div class="attribution">— {$QuoteCredit}</div>
            </div>
          <% else_if Type = 2 %>
            <% if BackgroundColour = 1 %>
            <div class="about-photo-view small-photo dark-background">
            <% else %>
            <div class="about-photo-view small-photo">
            <% end_if %>
              <div class="image-window"><img src="{$HeroImage.URL}"></div>
              <% if ImageCredit %>
                <div class="about-caption small-photo">{$ImageCredit}</div>
              <% end_if %>
            </div>
          <% else_if Type = 3 %>
            <% if BackgroundColour = 1 %>
            <div class="about-photo-view dark-background">
            <% else %>
            <div class="about-photo-view">
            <% end_if %>
              <div class="image-window"><img src="{$HeroImage.URL}"></div>
              <% if ImageCredit %>
                <div class="about-caption">{$ImageCredit}</div>
              <% end_if %>
            </div>
          <% end_if %>
        <% end_loop %>
      </div>

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