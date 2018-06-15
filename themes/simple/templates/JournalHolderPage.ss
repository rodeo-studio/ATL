<!DOCTYPE html>
<html>
<head>
<% base_tag %>
<% include GetIncludes %>
<link href='static-assets/css/journals.css' rel='stylesheet' />
</head>

<body class="header-colour-toggle">
<% include DisplayAnalytics %>
<script>
var APP = 'DefApp';
</script>

<div id="top" class="journal-view">
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
      <div class="journal-detail-view">
        <div id="macy-container">
        <% control Journal %>
          <div class="journal-post">
            <div class="post-container">
              <a href="{$Link}">
              <div class="image-container">
                <img src="{$HeroImage.URL}" alt="">
                <div class="overlay"></div>
              </div>
              <div class="content">
              <h1>{$MenuTitle}</h1>
              $Synopsis
              <div class="link">Read More</div>
              </div>
              </a>
            </div>
          </div>
        <% end_control %>
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