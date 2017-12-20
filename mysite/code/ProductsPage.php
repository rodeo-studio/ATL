<?php
class ProductsPage extends Page {

  private static $db = array(
    'BaseImageParallax' => 'Boolean',
    'BaseImageCaption' => 'Text'
  );

  private static $has_many = array(
  );

  private static $has_one = array(
    'BaseImage' => 'Image'
  );

  function getCMSFields() {
    $fields = parent::getCMSFields();

    $uploadField1 = new UploadField($name = 'BaseImage', $title = 'Base Image');
    $uploadField1->setCanUpload(false);
    $fields->addFieldToTab('Root.Main', $uploadField1);
    $fields->addFieldToTab("Root.Main", new CheckboxField ('BaseImageParallax', 'Enable Parallax'));
    $fields->addFieldToTab('Root.Main', new TextField('BaseImageCaption', 'Base Image Caption'));

    return $fields;
  }

}
class ProductsPage_Controller extends Page_Controller {
  private static $allowed_actions = array (
  );

  public function init() {
    parent::init();
  }
}
