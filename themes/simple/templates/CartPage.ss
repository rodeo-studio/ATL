<!DOCTYPE html>
<html>
<head>
<% base_tag %>
<% include GetIncludes %>
<link href='static-assets/css/cart.css' rel='stylesheet' />
</head>

<body>
<script>
var APP = 'DefApp';
</script>

<div id="top">
  <div class="container-fluid nopadding">
    <div id="content" class="content clearfix">
      <div class="cart-intro-view clearfix">
        <h1>$MenuTitle</h1>
        <div class="break"></div>
      </div>

      <div class="cart-detail-view clearfix">
        <div id="cart-detail-view"></div>
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

<script type="text/template" id="cartDetailViewTemplate">
  <div class="cart" data-id="{{= cart.checkout.id }}">


  {{ _.each(cart.checkout.lineItems.edges, function(item, index) { }}
    <div class="item">
    {{= item.node.title }}
    {{= item.node.variant.price }}

    <div class="qty-selector">
      <span class="btn-qty btn-less btn-decrement-cart-item-qty" data-id="{{= item.node.id }}">-</span><span class="qty" data-min-qty="1" data-qty-inc="1" data-qty="1">{{= item.node.quantity }} </span><span class="btn-qty btn-more btn-increment-cart-item-qty" data-id="{{= item.node.id }}">+</span>
    </div>

    <span class="link btn-remove-cart-item" data-id="{{= item.node.id }}">Remove</span>
    </div>
  {{ }); }}

  Order Total {{= cart.checkout.subtotalPrice }}

  <a class="btn" href="{$BaseHref}products">Back to wines</a>

  <a class="btn primary-btn" href="{{= cart.checkout.webUrl }}">Checkout</a>

  </div>
</script>

<% include DisplayAnalytics %>
</body>
<script data-main="static-assets/js/main" src="static-assets/js/libs/require.min.js"></script>
</html>