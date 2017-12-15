<!DOCTYPE html>
<html>
<head>
<% base_tag %>
<% include GetIncludes %>
<link href='static-assets/css/about.css' rel='stylesheet' />
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
      <div class="about-detail-view">
        <div class="about-text-view dark-background text-cols">
          <p>
          <u>Atumqui doloria derum</u>
          <br/><br/>
          Laborun totatur soluptatur? Nullacc uptatur archili sinvel is dessunt vide veris vit utemqui autamus maximus vent a nihillut vellorum quatiur ratqui re, officiis eruptat quossed qui voluptur sed ea dollest iaerepu ditaturd molut et, temodit aut recae porem rat aliandu saectur accumendem il min rehendit labo. Erum repelectat ut reperit, omnimus recto tem Et voloriossim ratenis que si dolut quibustrum quae non culluptas id molut et, temodit aut recae porem rat aliandu saectur accumendem il min rehendit labo. Erum repelectat ut reperit, omnimus recto tem dissit moluptatur, aut eture consere ssedis ne reium aut experistio volorum estet.  vit utemqui autamus maximus vent a nihillut vel voluptur sed ea dollest iaerepu ditatur.
          </p>
          <p>
          <u>Et voloriossim ratenis</u>
          <br/><br/>
          Que si dolut quibustrum quae non culluptas id molut et, temodit aut recae porem rat aliandu saectur accumendem il min rehendit labo. Erum repelectat ut reperit, omnimus recto tem dissit moluptatur, aut eture consere ssedis ne reium aut experistio volorum estet.
          <br/><br/>
          Atumqui doloria derum laborun totatur soluptatur? Nullacc uptatur archili sinvel is dessunt vide verd molut et, temodit aut recae porem rat aliandu saectur accumendem il min rehendit labo. Erum repelectat ut reperit, omnimus recto tem is vit utemqui autamus maximus vent a nihillut vel voluptur sed ea dollest iaerepu ditatur.
          <p>
        </div>

        <div class="quote-view">
          “lUn atur SolU PtAtut Vel Lrum oF fis erUp tat.”
          <div class="attribution">— joe Smith</div>
        </div>

        <div class="about-photo-view">
          <div class="image-window" style="background-image: url('http://pixelcog.github.io/parallax.js/img/helix-nebula-1400x1400.jpg')"></div>
          <div class="about-caption">Caption to go here</div>
        </div>

        <div class="about-text-view text-cols">
          <p>
          <u>Atumqui doloria derum</u>
          <br/><br/>
          Laborun totatur soluptatur? Nullacc uptatur archili sinvel is dessunt vide veris vit utemqui autamus maximus vent a nihillut vellorum quatiur ratqui re, officiis eruptat quossed qui voluptur sed ea dollest iaerepu ditaturd molut et, temodit aut recae porem rat aliandu saectur accumendem il min rehendit labo. Erum repelectat ut reperit, omnimus recto tem Et voloriossim ratenis que si dolut quibustrum quae non culluptas id molut et, temodit aut recae porem rat aliandu saectur accumendem il min rehendit labo. Erum repelectat ut reperit, omnimus recto tem dissit moluptatur, aut eture consere ssedis ne reium aut experistio volorum estet.  vit utemqui autamus maximus vent a nihillut vel voluptur sed ea dollest iaerepu ditatur.
          </p>
          <p>
          <u>Et voloriossim ratenis</u>
          <br/><br/>
          Que si dolut quibustrum quae non culluptas id molut et, temodit aut recae porem rat aliandu saectur accumendem il min rehendit labo. Erum repelectat ut reperit, omnimus recto tem dissit moluptatur, aut eture consere ssedis ne reium aut experistio volorum estet.
          <br/><br/>
          Atumqui doloria derum laborun totatur soluptatur? Nullacc uptatur archili sinvel is dessunt vide verd molut et, temodit aut recae porem rat aliandu saectur accumendem il min rehendit labo. Erum repelectat ut reperit, omnimus recto tem is vit utemqui autamus maximus vent a nihillut vel voluptur sed ea dollest iaerepu ditatur.
          <p>
        </div>

        <div class="about-photo-view small-photo">
          <div class="image-window" style="background-image: url('http://pixelcog.github.io/parallax.js/img/helix-nebula-1400x1400.jpg')"></div>
          <div class="about-caption">Caption to go here</div>
        </div>
      </div>

      <div class="feature-photo-view">
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

<% include DisplayAnalytics %>
</body>
<script data-main="static-assets/js/main" src="static-assets/js/libs/require.min.js"></script>
</html>