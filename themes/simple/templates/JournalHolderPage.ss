<!DOCTYPE html>
<html>
<head>
<% base_tag %>
<% include GetIncludes %>
<link href='static-assets/css/journals.css' rel='stylesheet' />
</head>

<body>
<script>
var APP = 'DefApp';
</script>

<div id="top" class="journal-view">
  <div class="container-fluid nopadding">
    <div class="hero">
      <div class="hero-container">
        <div class="hero-carousel">
          <div class="hero-item image_container fade_on_load"><img class="scale" src="static-assets/images/temp_journal.jpg"></div>
        </div>
        <div class="strap">{$MenuTitle}</div>
        <div class="down"><i class="icon-down-arrow"></i></div>
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

      <div class="feature-photo-view">
        <div class="image-window" style="background-image: url('http://pixelcog.github.io/parallax.js/img/helix-nebula-1400x1400.jpg')"></div>
        <div class="feature-caption">Caption to go here</div>
      </div>

      <div class="page-extra-highlight-view clearfix">
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 nopadding">
          <div class="element-container">
            <div class="content-container">
              <img src="static-assets/images/temp_home_page3.jpg">
              <div class="overlay"></div>
              <div class="text">
                <div class="title">Journal</div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 nopadding">
          <div class="element-container">
            <div class="content-container">
              <img src="static-assets/images/temp_home_page3.jpg">
              <div class="overlay"></div>
              <div class="text">
                <div class="title">Contact</div>
              </div>
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