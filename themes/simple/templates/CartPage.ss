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
    {{ if (cart.checkout.lineItems.edges.length) { }}
      <div class="titles row">
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-5 nopadding"></div>
        <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 price nopadding">Price</div>
        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-3 qty nopadding">Qnty</div>
        <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 nopadding"></div>
        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 total-price nopadding">Total</div>
      </div>
      {{ _.each(cart.checkout.lineItems.edges, function(item, index) { }}
        <div class="item row {{ if (!item.valid) { }}invalid{{ } }}">
          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-5 nopadding">
            <div class="title">{{= item.node.title }}</div>
            {{ if (item.node.variant.title == 'Default Title') { }}
              <div class="note">(Minimum 6 per order)</div>
            {{ } }}
          </div>
          <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 nopadding price">${{= item.node.variant.price }}</div>
          <div class="col-lg-2 col-md-2 col-sm-2 col-xs-3 nopadding qty">
            <div class="qty-selector">
              <span class="btn-qty btn-less btn-decrement-cart-item-qty" data-id="{{= item.node.id }}">-</span><span class="qty" data-min-qty="1" data-qty-inc="1" data-qty="1">{{= item.node.quantity }} </span><span class="btn-qty btn-more btn-increment-cart-item-qty" data-id="{{= item.node.id }}">+</span>
            </div>
          </div>
          <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 nopadding remove-link"><span class="link btn-remove-cart-item" data-id="{{= item.node.id }}">Remove</span></div>
          <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 nopadding total-price">
          {{ var total_price = item.node.variant.price * item.node.quantity }}

          ${{= total_price }}
          </div>
        </div>
      {{ }); }}

      <div class="summary row">
        <div class="col-lg-10 col-md-10 col-sm-10 col-xs-8 nopadding">
          <div class="title">Order Total</div>
          <div class="note">Shipping, taxes and discounts calculated as checkout</div>
        </div>
        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-4 nopadding title total-price">${{= cart.checkout.subtotalPrice }}</div>
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 nopadding">
          <div class="break light"></div>
        </div>
      </div>

      {{ if (!cartValid) { }}
        <div class="cart-invalid">
        There is a minimum of <strong>6 per order</strong> on all single bottles.  Please update your order.
        </div>
      {{ } }}
    {{ } else { }}
        <div class="cart-invalid">
        You have no items in your order.
        </div>
    {{ } }}

    <div class="btns row">
      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 nopadding">
      <a class="btn" href="{$BaseHref}products">Back to wines</a>{{ if (cartValid) { }}<a class="btn primary-btn" href="{{= cart.checkout.webUrl }}">Checkout</a>{{ } }}
      </div>
    </div>
  </div>
</script>

<% include DisplayAnalytics %>
</body>
<script data-main="static-assets/js/main" src="static-assets/js/libs/require.min.js"></script>
</html>