<!DOCTYPE html>
<html>
<head>
<% base_tag %>
<% include GetIncludes %>
<link href='static-assets/css/faq.css' rel='stylesheet' />
</head>

<body>
<script>
var APP = 'DefApp';
</script>

<div id="top">
  <div class="container-fluid nopadding">
    <div id="content" class="content clearfix">
      <div class="faq-view">
        <div class="faq-block-view">
          <h1>FAQS</h1>
          <% loop FAQGeneralElements %>
            <div class="text-block-view">
              <div class="break light"></div>
              <div class="text">
              <h2>$Title</h2>
              $Content
              </div>
            </div>
          <% end_loop %>
        </div>
        <div class="faq-block-view">
          <h1>Shipping</h1>
          <% loop FAQShippingElements %>
            <div class="text-block-view">
              <div class="break light"></div>
              <div class="text">
              <h2>$Title</h2>
              $Content
              </div>
            </div>
          <% end_loop %>
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