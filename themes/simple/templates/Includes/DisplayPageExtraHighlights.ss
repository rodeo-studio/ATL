<div class="page-extra-highlight-view clearfix">
  <% control PageExtraLink1 %>
    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 nopadding">
      <div class="element-container">
        <div class="content-container">
          <a href="{$Link}">
          <img src="{$Top.PageExtraLinkImage1.URL}">
          <div class="overlay"></div>
          <div class="text">
            <div class="title-container">
              <div class="title">$MenuTitle</div>
            </div>
          </div>
          </a>
        </div>
      </div>
    </div>
  <% end_control %>

  <% control PageExtraLink2 %>
    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 nopadding">
      <div class="element-container">
        <div class="content-container">
          <a href="{$Link}">
          <img src="{$Top.PageExtraLinkImage2.URL}">
          <div class="overlay"></div>
          <div class="text">
            <div class="title-container">
              <div class="title">$MenuTitle</div>
            </div>
          </div>
          </a>
        </div>
      </div>
    </div>
  <% end_control %>
</div>
