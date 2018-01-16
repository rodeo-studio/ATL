<div class="page-highlight-view clearfix">
  <% control PageLink1 %>
    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 nopadding">
      <div class="element-container">
        <div class="content-container">
          <a href="$Link">
          <img src="{$Top.PageLinkImage1.URL}">
          <div class="overlay"></div>
          <div class="text">
            <div class="title"><% if ShortName %>$ShortName<% else %>$MenuTitle<% end_if %></div>
            <div class="synopsis">$Top.PageLink1Synopsis</div>
          </div>
          </a>
        </div>
      </div>
    </div>
  <% end_control %>

  <% control PageLink2 %>
    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 nopadding">
      <div class="element-container">
        <div class="content-container">
          <a href="$Link">
          <img src="{$Top.PageLinkImage2.URL}">
          <div class="overlay"></div>
          <div class="text">
            <div class="title"><% if ShortName %>$ShortName<% else %>$MenuTitle<% end_if %></div>
            <div class="synopsis">$Top.PageLink2Synopsis</div>
          </div>
          </a>
        </div>
      </div>
    </div>
  <% end_control %>
</div>