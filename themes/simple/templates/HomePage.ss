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
          <div class="hero-item image_container fade_on_load"><img class="scale" src="static-assets/images/temp_home_hero.jpg"></div>
        </div>
        <div class="strap">
          <div class="logo"><img src="static-assets/images/logo.png"></div>
        </div>
        <div class="down"><i class="icon-down-arrow"></i></div>
      </div>
    </div>

    <div id="content" class="content clearfix">
      <div class="page-highlight-view clearfix">
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 nopadding">
          <div class="element-container">
            <div class="content-container">
              <img src="static-assets/images/temp_home_page1.jpg">
              <div class="overlay"></div>
              <div class="text">
                <div class="title">Wines</div>
                <div class="synopsis">
                Sedit, volumquunt, voluptatem onsedis millenis acimo occatus atur suntemo dipicti bustis molorem volorer rorepuditem iniat quiam fugiti utecture.
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 nopadding">
          <div class="element-container">
            <div class="content-container">
              <img src="static-assets/images/temp_home_page2.jpg">
              <div class="overlay"></div>
              <div class="text">
                <div class="title">About Us</div>
                <div class="synopsis">
                Sedit, volumquunt, voluptatem onsedis millenis acimo occatus atur suntemo dipicti bustis molorem volorer rorepuditem iniat quiam fugiti utecture.
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="quote-view clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 nopadding">
        h AljDHhS jmqui dOlOria derum l Un atur SolUPtAtut VelLrum q  are oFfis erUptat.
        </div>
      </div>

      <div class="feature-photo-view">
        <div class="parallax-window" data-parallax="scroll" data-image-src="http://pixelcog.github.io/parallax.js/img/helix-nebula-1400x1400.jpg"></div>
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