<?php
class FAQPage extends Page {

  private static $db = array(
  );

  private static $has_many = array(
    'FAQGeneralElements' => 'FAQGeneralElement',
    'FAQShippingElements' => 'FAQShippingElement'
  );

  private static $has_one = array(
  );

  function getCMSFields() {
    $fields = parent::getCMSFields();

    // remove fields
    $fields->removeFieldFromTab('Root.Main', 'Content');

    // FAQ Elements
    $config = GridFieldConfig_RelationEditor::create();
    $config->removeComponentsByType('GridFieldPaginator');
    $config->removeComponentsByType('GridFieldPageCount');
    $config->addComponent(new GridFieldSortableRows('SortID'));
    $faqGeneralElementField = new GridField(
      'FAQGeneralElement', // Field name
      'FAQ General Element', // Field title
      $this->FAQGeneralElements(),
      $config
    );
    $fields->addFieldToTab('Root.Main', new LiteralField ('literalfield', '<strong>FAQ General</strong>')); 
    $fields->addFieldToTab('Root.Main', $faqGeneralElementField); 

    $config2 = GridFieldConfig_RelationEditor::create();
    $config2->removeComponentsByType('GridFieldPaginator');
    $config2->removeComponentsByType('GridFieldPageCount');
    $config2->addComponent(new GridFieldSortableRows('SortID'));
    $faqShippingElementField = new GridField(
      'FAQShippingElement', // Field name
      'FAQ Shipping Element', // Field title
      $this->FAQShippingElements(),
      $config2
    );
    $fields->addFieldToTab('Root.Main', new LiteralField ('literalfield', '<strong>FAQ Shipping</strong>')); 
    $fields->addFieldToTab('Root.Main', $faqShippingElementField); 

    return $fields;
  }

}
class FAQPage_Controller extends Page_Controller {
  private static $allowed_actions = array (
  );

  public function init() {
    parent::init();
  }
}
