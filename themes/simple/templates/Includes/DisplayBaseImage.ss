<% if BaseImage %>
  <div class="feature-photo-view clearfix">
    <% if BaseImageParallax %>
      <div class="parallax-window" data-parallax="scroll" data-image-src="{$BaseImage.URL}"></div>
    <% else %>
      <div class="image-window" style="background-image: url('{$BaseImage.URL}')"></div>
    <% end_if %>
    <% if BaseImageCaption %>
      <div class="feature-caption">{$BaseImageCaption}</div>
    <% end_if %>
  </div>
<% end_if %>
