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
var LOCATION_FRIENDLY_TIME = '$LocationFriendlyTime';
</script>

<div id="top">
  <div class="container-fluid nopadding">
    <div id="content" class="content clearfix">
      <div class="products-intro-view clearfix">
        <h1>$MenuTitle</h1>
        <div class="intro">$Content</div>
        <div class="links">
          <span class="link" data-id="01 White">White</span> <span class="link" data-id="02 Red">Red</span> <span class="link" data-id="03 Mixed">Mixed Packs</span> <span class="link" data-id="All">All</span>
        </div>
        <div class="break"></div>
      </div>

      <div class="products-view clearfix">
        <div id="products-view" class="flex-grid"></div>
      </div>

      <% include DisplayBaseImage %>

      <% include DisplayPageExtraHighlights %>

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
          <div class="sticker-container">
            <div class="sticker"><img src="static-assets/images/sold_out.svg"></div>
          </div>
       {{ } else if (product.node.variants.edges[0].node.price == 0) { }}
          <div class="sticker-container">
            <div class="sticker"><img src="static-assets/images/coming_soon.svg"></div>
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