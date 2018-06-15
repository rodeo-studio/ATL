<!DOCTYPE html>
<html>
<head>
<% base_tag %>
<% include GetIncludes %>
<link href='https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css' rel='stylesheet' />
<link href='https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css' rel='stylesheet' />
<link href='static-assets/css/product.css' rel='stylesheet' />
</head>

<body>
<% include DisplayAnalytics %>
<script>
var APP = 'DefApp';
var PRODUCT_ID = '{$ProductID}';
var LOCATION_FRIENDLY_TIME = '$LocationFriendlyTime';
</script>

<div id="top" class="product-view">
  <div class="container-fluid nopadding">
    <div id="content" class="content clearfix">
      <div class="product-detail-view clearfix">
        <div id="product-detail-view" class="clearfix"></div>
      </div>

      <div class="product-explore-view clearfix">
        <h2>Explore our wines</h2>
        <div id="products-explore-view"></div>
      </div>

      <% include DisplayFooter %>
    </div>
  </div>

  <% include DisplayMainMenu %>
</div>

<div class="device-xs visible-xs"></div>
<div class="device-sm visible-sm"></div>
<div class="device-md visible-md"></div>
<div class="device-lg visible-lg"></div>

<script type="text/template" id="productViewTemplate">
  <div class="image-container">
    <div class="image" id="sticky_item">
    {{ if (images.edges.length) { }}
      <img src="{{= images.edges[0].node.src }}">
    {{ } }}
    </div>
  </div>
  <div class="content-container">
    <div class="hidden-lg hidden-md hidden-sm break"></div>
    <div class="title"><h1>{{= title }}</h1></div>
    {{ if (variants.edges[0].node.availableForSale && variants.edges[0].node.price > 0) { }}
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
        </div><span class="btn btn-add-to-cart" data-id="{{= variants.edges[0].node.id }}">Add to cart</span>
      </div>
    {{ } else { }}
      <div class="cart cart-btns">
      {{ if (!variants.edges[0].node.availableForSale) { }}
        <div class="msg">Sold out</div>
      {{ } else if (variants.edges[0].node.price == 0) { }}
        <div class="msg">Coming soon</div>
      {{ } }}
      </div>
    {{ } }}
    <div class="break light"></div>
    <div class="description">{{= descriptionHtml }}</div>

    <div class="hidden-lg hidden-md hidden-sm break"></div>
    <div class="hidden-xs break light"></div>

    <div class="hidden-xs back-nav">
      <div class="back-link"><a href="{$BaseHref}wines"><img src="static-assets/images/left_arrow.svg"><div class="link">Back to wines</div></a></div>
    </div>
  </div>

  <div class="hidden-lg hidden-md hidden-sm col-xs-12 nopadding">
    <div class="back-nav">
      <div class="back-link"><a href="{$BaseHref}wines"><img src="static-assets/images/left_arrow.svg"><div class="link">Back to wines</div></a></div>
    </div>
  </div>
</script>

<script type="text/template" id="productsExploreViewTemplate">
  <div class="products-container">
    <div class="arrow prev-arrow"><img src="static-assets/images/left_arrow.svg"></div>
    <div class="products">
      {{ _.each(products.edges, function(product, index) { }}
        {{ if (product.node.handle != products.currProductHandle) { }}
          <div class="product-container">
            <div class="product">
              <a href="{$BaseHref}products/product/{{= product.node.handle }}">
              <div class="image">
              {{ if (product.node.images.edges.length) { }}
                <img src="{{= product.node.images.edges[0].node.src }}">
              {{ } }}

              {{ if (!product.node.variants.edges[0].node.availableForSale) { }}
                <div class="sticker-container">
                  <div class="sticker"><img src="static-assets/images/sold_out.svg"></div>
                </div>
              {{ } else if (product.node.variants.edges[0].node.price == 0) { }}
                <div class="sticker-container">
                  <div class="sticker"><img src="static-assets/images/coming_soon.svg"></div>
                </div>
              {{ } }}
              </div>
              </a>
              <div class="detail">
                <div class="title">{{= product.node.title }}</div>
                {{ if (product.node.variants.edges[0].node.availableForSale && product.node.variants.edges[0].node.price > 0) { }}
                  {{ if (product.node.variants.edges[0].node.title == 'Default Title') { }}
                    <div class="price">${{= product.node.variants.edges[0].node.price }}/bottle</div>
                  {{ } else { }}
                    <div class="price">${{= product.node.variants.edges[0].node.price }}</div>
                  {{ } }}
                {{ } }}
              </div>
              {{ if (product.node.variants.edges[0].node.availableForSale && product.node.variants.edges[0].node.price > 0) { }}
                <div class="cart cart-btns">
                  <span class="btn hollow-btn btn-add-to-cart" data-id="{{= product.node.variants.edges[0].node.id }}">Add to cart</span>
                </div>
              {{ } }}
            </div>
          </div>
        {{ } }}
      {{ }); }}
    </div>
    <div class="arrow next-arrow"><img src="static-assets/images/right_arrow.svg"></div>
  </div>
</script>
</body>
<script data-main="static-assets/js/main" src="static-assets/js/libs/require.min.js"></script>
</html>