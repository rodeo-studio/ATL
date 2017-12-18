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
      </div>
      <% include DisplayFooter %>
    </div>
  </div>

  <% include DisplayMainMenu %>
</div>

<script type="text/template" id="productViewTemplate">
  <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 nopadding">
    <div class="image">
    {{ if (images.edges.length) { }}
      <img src="{{= images.edges[0].node.src }}">
    {{ } }}
    </div>
  </div>
  <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 nopadding">
    <div class="hidden-lg hidden-md hidden-sm break"></div>
    <div class="title"><h1>{{= title }}</h1></div>
    {{ if (variants.edges[0].node.availableForSale) { }}
      {{ if (variants.edges[0].node.title == 'Default Title') { }}
        <div class="price-details">
          <div class="price">${{= variants.edges[0].node.price }}/bottle
          </div>
          <div class="min">(minimum 6 per order)</div>
        </div>
      {{ } else { }}
        <div class="price-details">
          <div class="price">${{= variants.edges[0].node.price }}
          </div>
        </div>
      {{ } }}
      <div class="cart cart-btns">
        <div class="qty-selector">
          <span class="btn-qty btn-less">-</span><span class="qty" data-min-qty="1" data-qty-inc="1" data-qty="1">1</span><span class="btn-qty btn-more">+</span>
        </div><span class="btn btn-add-to-cart" data-id="{{= variants.edges[0].node.id }}">Add to Cart</span>
      </div>
    {{ } else { }}
      <div class="cart cart-btns">
        <div class="sold-out">Sold out</div>
      </div>

    {{ } }}
    <div class="break light"></div>
    <div class="description">{{= descriptionHtml }}</div>

    <div class="hidden-lg hidden-md hidden-sm break"></div>
    <div class="hidden-xs break light"></div>

    <div class="hidden-xs back-nav">
      <div class="back-link"><i class="fa fa-long-arrow-left"></i><div class="link">Back to wines</div></div>
    </div>
  </div>

  <div class="hidden-lg hidden-md hidden-sm col-xs-12 nopadding">
    <div class="back-nav">
      <div class="back-link"><i class="fa fa-long-arrow-left"></i><div class="link">Back to wines</div></div>
    </div>
  </div>

</script>

<% include DisplayAnalytics %>
</body>
<script data-main="static-assets/js/main" src="static-assets/js/libs/require.min.js"></script>
</html>