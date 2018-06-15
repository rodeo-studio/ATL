<?php
class FAQPage extends Page {

  private static $db = array(
    'FAQGeneralTitle' => 'Text',
    'FAQShippingTitle' => 'Text',
    'FAQTermsConditionsTitle' => 'Text',
    'FAQPrivacyTitle' => 'Text'    
  );

  private static $has_many = array(
    'FAQGeneralElements' => 'FAQGeneralElement',
    'FAQShippingElements' => 'FAQShippingElement',
    'FAQTermsElements' => 'FAQTermsElement',
    'FAQPrivacyElements' => 'FAQPrivacyElement'
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
    $fields->addFieldToTab('Root.Main', new TextField('FAQGeneralTitle', 'Title')); 
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
    $fields->addFieldToTab('Root.Main', new TextField('FAQShippingTitle', 'Title')); 
    $fields->addFieldToTab('Root.Main', $faqShippingElementField); 

    $config3 = GridFieldConfig_RelationEditor::create();
    $config3->removeComponentsByType('GridFieldPaginator');
    $config3->removeComponentsByType('GridFieldPageCount');
    $config3->addComponent(new GridFieldSortableRows('SortID'));
    $faqTermsElementField = new GridField(
      'FAQTermsElement', // Field name
      'FAQ Terms Element', // Field title
      $this->FAQTermsElements(),
      $config3
    );
    $fields->addFieldToTab('Root.Main', new LiteralField ('literalfield', '<strong>FAQ Terms & Conditions</strong>'));
    $fields->addFieldToTab('Root.Main', new TextField('FAQTermsConditionsTitle', 'Title')); 
    $fields->addFieldToTab('Root.Main', $faqTermsElementField); 

    $config4 = GridFieldConfig_RelationEditor::create();
    $config4->removeComponentsByType('GridFieldPaginator');
    $config4->removeComponentsByType('GridFieldPageCount');
    $config4->addComponent(new GridFieldSortableRows('SortID'));
    $faqPrivacyElementField = new GridField(
      'FAQPrivacyElement', // Field name
      'FAQ Privacy Element', // Field title
      $this->FAQPrivacyElements(),
      $config4
    );
    $fields->addFieldToTab('Root.Main', new LiteralField ('literalfield', '<strong>FAQ Privacy Policy</strong>')); 
    $fields->addFieldToTab('Root.Main', new TextField('FAQPrivacyTitle', 'Title')); 
    $fields->addFieldToTab('Root.Main', $faqPrivacyElementField); 

    return $fields;
  }

}
class FAQPage_Controller extends Page_Controller {
  private static $allowed_actions = array (
  );

  public function init() {
    parent::init();

    if ($this->getRequest()->param('FAQBlock')) {
      $this->FAQBlockAnchor = $this->getRequest()->param('FAQBlock');
    }
    $this->FAQPage = DataObject::get_one("FAQPage");
    $this->Title = $this->FAQPage->Title;
  }

  public function index($request) {
    return $this->renderWith('FAQPage');
  }
}
