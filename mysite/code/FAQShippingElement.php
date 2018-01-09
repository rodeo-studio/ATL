<?php
class FAQShippingElement extends FAQElement {
  private static $db = array(
  );

  private static $has_one = array(
    'FAQShipping' => 'FAQPage'
  );
}
