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

      <% include DisplayFeaturePhoto %>

      <% include DisplayPageExtraHighlights %>

      <% include DisplayFooter %>
    </div>
  </div>

  <% include DisplayMainMenu %>
</div>

<script type="text/template" id="cartDetailViewTemplate">
  <div class="cart" data-id="{{= cart.checkout.id }}">
    {{ if (cart.checkout.lineItems.edges.length) { }}
      <div class="break"></div>
      <div class="titles row">
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-5 nopadding"></div>
        <div class="col-lg-1 col-md-1 col-sm-1 col-xs-2 price nopadding">Price</div>
        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-3 qty nopadding">Qty</div>
        <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 hidden-xs nopadding"></div>
        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 total-price nopadding">Sub Total</div>
      </div>
      {{ _.each(cart.checkout.lineItems.edges, function(item, index) { }}
        <div class="item row {{ if (!item.valid) { }}invalid{{ } }}">
          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-5 nopadding">
            <div class="title">{{= item.node.title }}</div>
            {{ if (item.node.variant.title == 'Default Title') { }}
              <div class="note">(Minimum 6 per order)</div>
            {{ } }}
          </div>
          <div class="col-lg-1 col-md-1 col-sm-1 col-xs-2 nopadding price">${{= item.node.variant.price }}</div>
          <div class="col-lg-2 col-md-2 col-sm-2 col-xs-3 nopadding qty">
            <div class="qty-selector">
              <span class="btn-qty btn-less btn-decrement-cart-item-qty" data-id="{{= item.node.id }}">-</span><span class="qty" data-min-qty="1" data-qty-inc="1" data-qty="1">{{= item.node.quantity }} </span><span class="btn-qty btn-more btn-increment-cart-item-qty" data-id="{{= item.node.id }}">+</span>
            </div>
          </div>
          <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 nopadding remove-link hidden-xs"><span class="link btn-remove-cart-item" data-id="{{= item.node.id }}">Remove</span></div>
          <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 nopadding total-price">
          {{ var total_price = item.node.variant.price * item.node.quantity }}

          ${{= total_price.toFixed(2) }}
          </div>

          <div class="remove-link stick-to-bottom visible-xs"><span class="link btn-remove-cart-item" data-id="{{= item.node.id }}">Remove</span></div>
        </div>
      {{ }); }}

      <div class="summary row">
        <div class="col-lg-10 col-md-10 col-sm-10 col-xs-8 nopadding">
          <div class="title">Order Total</div>
          <div class="note">Shipping costs calculated at checkout</div>
        </div>
        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-4 nopadding title total-price">${{= cart.checkout.subtotalPrice }}</div>
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 nopadding">
          <div class="break light"></div>
        </div>
      </div>

      {{ if (!cartValid) { }}
        <div class="cart-invalid">The minimum order quantity for any individual wine is 6 bottles (unless otherwise specified). Please update your order.</div>
      {{ } }}
    {{ } else { }}
        <div class="cart-invalid">
        You have no items in your cart.
        </div>
    {{ } }}

    <div class="btns row">
      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 nopadding">
      <a class="btn" href="{$BaseHref}products">Back to wines</a>{{ if (cartValid) { }}<span class="btn primary-btn checkout-btn">Checkout</span>{{ } }}
      </div>
    </div>
  </div>

  <div id="termsModal" class="modal overlay" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-body">
          <div class="text">
          If you purchase products from Atlas  Wines through this site, you warrant that: you agree to our <a href="{$BaseHref}faqs/terms">Terms &amp; Conditions</a> and that you are aged 18 years or older.
          </div>
          <div class="btns">
          <span class="btn primary-btn" data-dismiss="modal">Cancel</span><a class="btn primary-btn" href="{{= cart.checkout.webUrl }}">I agree</a>
          </div>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->

</script>

<% include DisplayAnalytics %>
</body>
<script data-main="static-assets/js/main" src="static-assets/js/libs/require.min.js"></script>
</html>