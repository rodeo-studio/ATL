<!DOCTYPE html>
<html>
<head>
<% base_tag %>
<% include GetIncludes %>
<link href='static-assets/css/products.css' rel='stylesheet' />
</head>

<body>
<script>
var APP = 'DefApp';
</script>

<div id="top" class="products-view">
  <div class="container-fluid nopadding">
    <div id="content" class="content clearfix">
      <div class="page-products-intro-view clearfix">
        <h1>$MenuTitle</h1>
        <div class="intro">$Content</div>
        <div class="links">
          <span class="link">White</span> <span class="link">Red</span> <span class="link">Mixed Packs</span>
        </div>
        <div class="break"></div>
      </div>

      <div class="products-view clearfix">
        <div id="products-view"></div>
      </div>

      <div class="feature-photo-view clearfix">
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

      <div class="footer-view clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 nopadding">
          <div class="element-container">
            <div class="subscribe">
              <div class="msg">Subscribe for news updates  and special offers</div>
              <form>
                <input type="email" class="field required" id="form-email" placeholder="Email"><button type="submit" class="btn btn-default">Send</button>
              </form>
            </div>
            <div class="social">
            <ul>
              <li><a href=""><i class="fa fa-facebook"></i></a></li><li><a href=""><i class="fa fa-instagram"></i></a></li><li><a href=""><i class="fa fa-twitter"></i></a></li><li><a href=""><i class="fa fa-envelope-o"></i></a></li>
            </ul>
            </div>

            <div class="footer-block row">
              <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 nopadding">
                <div class="logo"><img src="static-assets/images/logo.png"></div>
              </div>
              <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 hidden-xs nopadding">
                <div class="location">
                <ul>
                  <li>Clare Valley</li>
                  <li>South Australia</li>
                </ul>
                <ul class="data">
                  <li><i class="fa fa-cloud"></i> 24&deg;C</li>
                  <li><i class="fa fa-clock-o"></i> 12:00 pm</li>
                </ul>
                </div>
              </div>
              <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 nopadding">
                <div class="links">
                <ul>
                  <li><a href="">Cart</a></li>
                  <li><a href="">FAQs</a></li>
                  <li><a href="">Shipping</a></li>
                  <li><a href="">Terms &amp; Conditions</a></li>
                  <li><a href="">Privacy Policy</a></li>
                  <li><a href="">Contact</a></li>
                </ul>
                </div>
              </div>
              <div class="col-lg-1 col-md-1 col-sm-1 col-xs-12 nopadding">
                <div class="top"><i class="icon-back-to-top"></i></div>
              </div>
            </div>

            <div class="copyright">© 2017 Atlas Wines — All Rights Reserved.  Design by <a href="http://rodeo.com.co/" target="_blank">Rodeo</a>. </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <% include DisplayMainMenu %>
</div>

<script type="text/template" id="productsViewTemplate">
  {{ _.each(products.edges, function(product, index) { }}
    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 nopadding">
      <div class="product-view">
        <a href="{$BaseHref}products/product/{{= product.node.handle }}">
        <div class="image"><img src="{{= product.node.images.edges[0].node.src }}"></div>
        {{ if (!product.node.variants.edges[0].node.availableForSale) { }}
          <div class="sold-out-container">
            <div class="sold-out"><img src="static-assets/images/sold_out.png"></div>
          </div>
        {{ } }}
        <div class="title">{{= product.node.title }}</div>
        </a>
      </div>
    </div>
  {{ }); }}
</script>

<% include DisplayAnalytics %>
</body>
<script data-main="static-assets/js/main" src="static-assets/js/libs/require.min.js"></script>
</html>