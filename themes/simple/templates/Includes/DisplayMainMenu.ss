<div id="cart-view"></div>

<div class="top-logo"><a href="{$BaseHref}"><img class="black" src="static-assets/images/logo_small.png"><img class="white" src="static-assets/images/logo_small_white.png"></a></div>

<div id="menu-overlay">
  <div class="menus">
  <ul>
    <li><a href="{$BaseHref}products">Wines</a></li>
    <li><a href="{$BaseHref}about">About Us</a></li>
    <li><a href="{$BaseHref}journal">Journal</a></li>
    <li><a href="{$BaseHref}vineyards-and-growers">Vineyards &amp; Growers</a></li>
    <li><a href="{$BaseHref}contact">Contact</a></li>
    <li><a href="{$BaseHref}faqs">FAQ</a></li>
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
  <div class="cart-menu">
    <div class="cart">
      <a href="{$BaseHref}cart"><i class="fa fa-shopping-cart"></i></a>
    </div>
    <div class="items">({{= cartQty }})</div>
  </div>
</script>
