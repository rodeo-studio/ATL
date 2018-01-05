<!DOCTYPE html>
<html>
<head>
<% base_tag %>
<% include GetIncludes %>
<link href='static-assets/css/journal.css' rel='stylesheet' />
</head>

<body>
<script>
var APP = 'DefApp';
</script>

<div id="top" class="journal-view">
  <div class="container-fluid nopadding">

    <div id="content" class="content clearfix">
      <div class="journal-detail-view clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 nopadding">
        <img src="{$HeroImage.URL}">
        </div>
        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 nopadding">
        <div class="date">
        <span class="moment day_month">$JournalDate</span><br/>
        <span class="moment year">$JournalDate</span>
        </div>
        </div>
        <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12 nopadding">
          <div class="text-content">
            <h1>$MenuTitle</h1>
            $Content
            <div class="social">
            Share: <a href="http://www.facebook.com/share.php?u=http://www.atlaswines.com.au{$Link}" target="_blank">Facebook</a> <a href="https://twitter.com/intent/tweet?text=http://www.atlaswines.com.au{$Link}" target="_blank">Twitter</a> <a href="mailto:cellardoor@atlaswines.com.au?subject=Atlas Winery&body=Hi, you might like to see this - http://www.atlaswines.com.au{$Link}">Email</a>
            </div>
          </div>
        </div>
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 nopadding">
          <div class="break"></div>
          <div class="nav">
            <div class="nav-left nav-arrow">
            <% if PrevNextPage(prev) %>
              <% control PrevNextPage(prev) %><a href="$Link"><img src="static-assets/images/left_arrow.svg"></a><% end_control %><% else %><% control FirstLastPage(last) %><a href="$Link"><img src="static-assets/images/left_arrow.svg"></a><% end_control %>
            <% end_if %>
            </div><div class="nav-all"><a href="{$BaseHref}journal" class="highlight">Back to journal</a></div><div class="nav-right nav-arrow">
            <% if PrevNextPage(next) %>
              <% control PrevNextPage(next) %><a href="$Link"><img src="static-assets/images/right_arrow.svg"></a><% end_control %><% else %><% control FirstLastPage(first) %><a href="$Link"><img src="static-assets/images/right_arrow.svg"></a><% end_control %>
            <% end_if %>
            </div>
          </div>
        </div>
      </div>

      <div class="feature-photo-view">
        <div class="parallax-window" data-parallax="scroll" data-image-src="http://pixelcog.github.io/parallax.js/img/helix-nebula-1400x1400.jpg"></div>
        <div class="feature-caption">Caption to go here</div>
      </div>

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