<!DOCTYPE html>
<html>
<head>
<% base_tag %>
<% include GetIncludes %>
<link href='static-assets/css/contact.css' rel='stylesheet' />
</head>

<body class="header-colour-toggle">
<script>
var APP = 'DefApp';
</script>

<div id="top" class="about-view">
  <div class="container-fluid nopadding">
    <div class="hero">
      <div class="hero-container">
        <div class="hero-carousel">
          <div class="hero-item image_container fade_on_load"><img class="scale" src="static-assets/images/temp_journal.jpg"></div>
        </div>
        <div class="strap">{$MenuTitle}</div>
        <div class="down"><i class="icon-down-arrow"></i></div>
      </div>
    </div>

    <div id="content" class="content clearfix">
      <div class="contact-detail-view">
        <div class="contact-block clearfix">
          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 nopadding">
            <div class="title"><h1>ATLAS WINES</h1></div>
          </div>
          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 nopadding">
            <div class="text">
            <a href="mailto:cellardoor@atlaswines.com.au">cellardoor@atlaswines.com.au</a>
            <br/><br/>
            PO BOX 458, Clare SA <br/>
            Australia 5453
            </div>
          </div>
        </div>
        <div class="contact-block clearfix">
          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 nopadding">
            <div class="title"><h1>INTERESTED IN STOCKING ATLAS WINES?</h1></div>
          </div>
          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 nopadding">            
            <div class="text">
            <strong>South Australia</strong><br/>
            Chace Agencies<br/>
            <a href="mailto: admin@chace.com.au"> admin@chace.com.au</a>
            <hr>
            <strong>  New South Wales</strong><br/>
            Cuttings Wine Merchants<br/>
            <a href=""> adam@atlaswines.com.au</a>
            <hr>
            <strong>  Victoria</strong><br/>
             Steve Benjamin<br/>
            <a href=""> steve@trentwoodinternational.com.au</a>
            <hr>
            <strong>  Western Australia </strong><br/>
            Rob Palandri<br/>
            <a href=""> rpalandri@bigpond.com</a>
            <hr>
            <strong>  Queensland & Tasmania</strong><br/>
            Adam Barton<br/>
            <a href=""> adam@atlaswines.com.au</a>
            <hr>
            <strong>  International</strong><br/>
             Adam Barton<br/>
            <a href=""> adam@atlaswines.com.au</a>
            </div>
          </div>
        </div>
        <div class="contact-block clearfix">
          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 nopadding">            
            <div class="title"><h1>FOR MEDIA AND GENERAL ENQUIRIES</h1></div>
          </div>
          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 nopadding">            
            <div class="text">
            <strong>Amy Lane</strong><br/>
            <a href=""> office@atlaswines.com.au</a>
            </div>
          </div>
        </div>
      </div>

      <div class="feature-photo-view">
        <div class="image-window" style="background-image: url('static-assets/images/temp_contact.jpg')"></div>
      </div>

      <% include DisplayPageExtraHighlights %>

      <% include DisplayFooter %>
    </div>
  </div>

  <% include DisplayMainMenu %>
</div>

<% include DisplayAnalytics %>
</body>
<script data-main="static-assets/js/main" src="static-assets/js/libs/require.min.js"></script>
</html>