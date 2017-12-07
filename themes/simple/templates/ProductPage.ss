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
        <div id="product-detail-view" class="clearfix"></div>
        <div class="back-nav">
          <div class="back-link"><i class="fa fa-long-arrow-left"></i><div class="link">Back to wines</div></div>
        </div>
      </div>

      <% include DisplayFooter %>
    </div>
  </div>

  <% include DisplayMainMenu %>
</div>

<script type="text/template" id="productViewTemplate">
  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 nopadding">
    <div class="image"><img src="{{= images.edges[0].node.src }}"></div>
    <div class="break"></div>
    <div class="title"><h1>{{= title }}</h1></div>
    <div class="price">${{= variants.edges[0].node.price }}/bottle (minimum 6 per order)</div>
    <div class="cart-btns">
      <div class="qty-selector">
        <span class="btn-qty btn-less">-</span>
        <span class="qty" data-min-qty="6" data-qty-inc="6" data-qty="6">6</span>
        <span class="btn-qty btn-more">+</span>
      </div><span class="btn btn-add-to-cart" data-id="{{= variants.edges[0].node.id }}">Add to Cart</span>
    </div>
    <div class="break light"></div>
    <div class="description">{{= descriptionHtml }}</div>
    <div class="break"></div>
  </div>
</script>

<% include DisplayAnalytics %>
</body>
<script data-main="static-assets/js/main" src="static-assets/js/libs/require.min.js"></script>
</html>