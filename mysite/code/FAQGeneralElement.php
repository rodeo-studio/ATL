<?php
class FAQGeneralElement extends FAQElement {
  private static $db = array(
  );

  private static $has_one = array(
    'FAQGeneral' => 'FAQPage'
  );
}
