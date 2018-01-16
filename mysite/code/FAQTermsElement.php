<?php
class FAQTermsElement extends FAQElement {
  private static $db = array(
  );

  private static $has_one = array(
    'FAQTerms' => 'FAQPage'
  );
}
