<?php
class ContactPage extends Page {

  private static $db = array(
    'MainContactInfo' => 'HTMLText',
    'StockingContactInfo' => 'HTMLText',
    'MediaContactInfo' => 'HTMLText'
  );

  private static $has_many = array(
  );

  private static $has_one = array(
    'HeroImage' => 'Image',
    'BaseImage' => 'Image',    
    'PageExtraLink1' => 'SiteTree',
    'PageExtraLinkImage1' => 'Image',
    'PageExtraLink2' => 'SiteTree',
    'PageExtraLinkImage2' => 'Image'
  );

  function getCMSFields() {
    $fields = parent::getCMSFields();

    // remove fields
    $fields->removeFieldFromTab('Root.Main', 'Content');

    $uploadField1 = new UploadField($name = 'HeroImage', $title = 'Image');
    $uploadField1->setCanUpload(false);
    $fields->addFieldToTab('Root.Main', $uploadField1);

    // Contact
    $fields->addFieldToTab('Root.Main', new HtmlEditorField('MainContactInfo', 'Main Contact'));
    $fields->addFieldToTab('Root.Main', new HtmlEditorField('StockingContactInfo', 'Stocking Contact'));
    $fields->addFieldToTab('Root.Main', new HtmlEditorField('MediaContactInfo', 'Media Contact'));

    $uploadBaseField = new UploadField($name = 'BaseImage', $title = 'Base Image');
    $uploadBaseField->setCanUpload(false);
    $fields->addFieldToTab('Root.Main', $uploadBaseField);

    // Page extra links
    $fields->addFieldToTab('Root.PageLinks', new LiteralField('literalfield', '<strong>Page Extra Link 1</strong>'));
    $fields->addFieldToTab('Root.PageLinks', new TreeDropdownField('PageExtraLink1ID', 'Page', 'Page'));
    $uploadPageExtraLinkField1 = new UploadField($name = 'PageExtraLinkImage1', $title = 'Image');
    $uploadPageExtraLinkField1->setCanUpload(false);
    $fields->addFieldToTab('Root.PageLinks', $uploadPageExtraLinkField1);

    $fields->addFieldToTab('Root.PageLinks', new LiteralField('literalfield', '<strong>Page Extra Link 2</strong>')); 
    $fields->addFieldToTab('Root.PageLinks', new TreeDropdownField('PageExtraLink2ID', 'Page', 'Page'));
    $uploadPageExtraLinkField2 = new UploadField($name = 'PageExtraLinkImage2', $title = 'Image');
    $uploadPageExtraLinkField2->setCanUpload(false);
    $fields->addFieldToTab('Root.PageLinks', $uploadPageExtraLinkField2);

    return $fields;
  }

}
class ContactPage_Controller extends Page_Controller {
  private static $allowed_actions = array (
  );

  public function init() {
    parent::init();
  }
}
