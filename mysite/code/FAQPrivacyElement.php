<?php
class FAQPrivacyElement extends FAQElement {
  private static $db = array(
  );

  private static $has_one = array(
    'FAQPrivacy' => 'FAQPage'
  );
}
