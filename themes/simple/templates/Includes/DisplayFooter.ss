<div class="footer-view clearfix">
  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 nopadding">
    <div class="element-container">
      <div class="subscribe">
        <div class="msg">Subscribe for news updates  and special offers</div>
        <form id="signup" class="form-signup" method="post">
          <input type="email" class="field required" id="form-email" placeholder="Email"><button type="submit" class="btn btn-default">Send</button>

          <div class="form-error">
            <div class="help-block">Please fill in your email address</div>
          </div>

          <div class="thanks">Thank you for subscribing!</div>
        </form>
      </div>
      <div class="social">
      <ul>
        <li><a href="{$Home.SocialFacebook}" target="_blank"><i class="fa fa-facebook"></i></a></li><li><a href="{$Home.SocialInstagram}" target="_blank"><i class="fa fa-instagram"></i></a></li><li><a href="mailto:{$Home.SocialEmail}"><i class="fa fa-envelope-o"></i></a></li>
      </ul>
      </div>

      <div class="footer-block row">
        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 nopadding">
          <div class="logo"><img src="static-assets/images/logo.png"></div>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 hidden-xs nopadding">
          <div class="location">
          <ul>
            <li>Clare Valley</li>
            <li>South Australia</li>
          </ul>
          <ul class="data">
            <div id="weather-view"></div>
            <li><i class="fa fa-clock-o"></i> {$LocationFriendlyTime}</li>
          </ul>
          </div>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 nopadding">
          <div class="links">
          <ul>
            <li><a href="{$BaseHref}cart">Cart</a></li>
            <li><a href="{$BaseHref}faqs">FAQs</a></li>
            <li><a href="{$BaseHref}faqs/shipping">Shipping</a></li>
            <li><a href="{$BaseHref}faqs/terms">Terms &amp; Conditions</a></li>
            <li><a href="{$BaseHref}faqs/privacy">Privacy Policy</a></li>
            <li><a href="{$BaseHref}contact">Contact</a></li>
          </ul>
          </div>
        </div>
        <div class="col-lg-1 col-md-1 col-sm-1 col-xs-12 nopadding">
          <div class="top"><i class="icon-back-to-top"></i></div>
        </div>
      </div>

      <div class="copyright">© 2018 Atlas Wines — All Rights Reserved.  Design by <a href="http://rodeo.com.co/" target="_blank">Rodeo</a>. </div>
    </div>
  </div>
</div>

<script type="text/template" id="weatherViewTemplate">
  <li><i class="wi wi-{{= weatherType }}"></i> {{= Math.round(weather.main.temp) }}&deg;C</li>
</script>
