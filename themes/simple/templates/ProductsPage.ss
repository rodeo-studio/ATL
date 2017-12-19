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

<div id="top">
  <div class="container-fluid nopadding">
    <div id="content" class="content clearfix">
      <div class="products-intro-view clearfix">
        <h1>$MenuTitle</h1>
        <div class="intro">$Content</div>
        <div class="links">
          <span class="link" data-id="All">All</span> <span class="link" data-id="White">White</span> <span class="link" data-id="Red">Red</span> <span class="link" data-id="Mixed">Mixed Packs</span>
        </div>
        <div class="break"></div>
      </div>

      <div class="products-view clearfix">
        <div id="products-view" class="flex-grid"></div>
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

      <% include DisplayFooter %>
    </div>
  </div>

  <% include DisplayMainMenu %>
</div>

<script type="text/template" id="productsViewTemplate">
  {{ _.each(products.edges, function(product, index) { }}
    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 nopadding">
      <div class="product-view">
        <a href="{$BaseHref}products/product/{{= product.node.handle }}">
        <div class="image">
        {{ if (product.node.images.edges.length) { }}
          <img src="{{= product.node.images.edges[0].node.src }}">
        {{ } }}
        </div>
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