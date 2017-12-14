<div id="cart-view"></div>

<div class="top-logo"><a href="{$BaseHref}"><img class="black" src="static-assets/images/logo_small.png"><img class="white" src="static-assets/images/logo_small_white.png"></a></div>

<div id="menu-overlay">
  <div class="menus">
  <ul>
    <li><a href="{$BaseHref}products">Wines</a></li>
    <li><a href="{$BaseHref}about">About Us</a></li>
    <li><a href="{$BaseHref}journal">Journal</a></li>
    <li><a href="{$BaseHref}">Vineyards &amp; Growers</a></li>
    <li><a href="{$BaseHref}">Contact</a></li>
    <li><a href="{$BaseHref}">FAQ</a></li>
  </ul>
  </div>
</div>

<div class="main-menu">
  <div id="menu-btn">
    <span></span>
    <span></span>
    <span></span>
  </div>
</div>

<script type="text/template" id="cartViewTemplate">
<!--
  <div data-id="{{= cart.checkout.id }}">
  {{ _.each(cart.checkout.lineItems.edges, function(item, index) { }}
    <div class="item">
    {{= item.node.title }} - {{= item.node.quantity }} <span class="btn btn-update-cart-item-qty" data-id="{{= item.node.id }}">Update</span> <span class="btn btn-remove-cart-item" data-id="{{= item.node.id }}">Remove</span>
    </div>
  {{ }); }}
  </div>
-->
  <div class="cart-menu">
    <div class="cart">
      <a href="{{= cart.checkout.webUrl }}"><i class="fa fa-shopping-cart"></i></a>
    </div>
    <div class="items">({{= cartQty }})</div>
  </div>
</script>
