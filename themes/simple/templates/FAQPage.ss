<!DOCTYPE html>
<html>
<head>
<% base_tag %>
<% include GetIncludes %>
<link href='static-assets/css/faq.css' rel='stylesheet' />
</head>

<body data-block="{$FAQBlockAnchor}">
<script>
var APP = 'DefApp';
</script>

<div id="top">
  <div class="container-fluid nopadding">
    <div id="content" class="content clearfix">
      <% loop FAQPage %>
        <div class="faq-view">
          <div class="faq-block-view">
            <a id="faqs" name="faqs"></a>
            <h1>FAQS</h1>
            <% loop FAQGeneralElements %>
              <% include DisplayFAQTextBlock %>
            <% end_loop %>
          </div>
          <div class="faq-block-view" id="shipping">
            <a name="shipping"></a>
            <h1>Shipping</h1>
            <% loop FAQShippingElements %>
              <% include DisplayFAQTextBlock %>
            <% end_loop %>
          </div>
          <div class="faq-block-view">
            <a id="terms" name="terms"></a>
            <h1>Terms & Conditions</h1>
            <% loop FAQTermsElements %>
              <% include DisplayFAQTextBlock %>
            <% end_loop %>
          </div>
          <div class="faq-block-view">
            <a id="privacy" name="privacy"></a>
            <h1>Privacy Policy</h1>
            <% loop FAQPrivacyElements %>
              <% include DisplayFAQTextBlock %>
            <% end_loop %>
          </div>
        </div>
      <% end_loop %>

      <% include DisplayFooter %>
    </div>
  </div>

  <% include DisplayMainMenu %>
</div>

<% include DisplayAnalytics %>
</body>
<script data-main="static-assets/js/main" src="static-assets/js/libs/require.min.js"></script>
</html>