<!DOCTYPE html>
<html>
<head>
<% base_tag %>
<% include GetIncludes %>
<link href='static-assets/css/product.css' rel='stylesheet' />
</head>

<body>
<script>
var APP = 'DefApp';
var PRODUCT_ID = '{$ProductID}';
</script>

<div id="top" class="product-view">
  <div class="container-fluid nopadding">
    <div id="content" class="content clearfix">

      <div class="product-detail-view clearfix">
        <div id="product-detail-view"></div>
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

<script type="text/template" id="productViewTemplate">
  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 nopadding">

    <div class="image"><img src="{{= images.edges[0].node.src }}"></div>
    <div class="title"><h1>{{= title }}</h1></div>
    <div class="price">{{= variants.edges[0].node.price }}</div>

    <span class="btn btn-add-to-cart" data-id="{{= variants.edges[0].node.id }}">Add to Cart</span>

    <div class="description">{{= descriptionHtml }}</div>
  </div>
</script>

<% include DisplayAnalytics %>
</body>
<script data-main="static-assets/js/main" src="static-assets/js/libs/require.min.js"></script>
</html>