<?php
class VineyardsPage extends Page {

  private static $db = array(
  );

  private static $has_many = array(
  );

  private static $has_one = array(
    'HeroImage' => 'Image'
  );

  function getCMSFields() {
    $fields = parent::getCMSFields();

    // remove fields
    $fields->removeFieldFromTab('Root.Main', 'Content');

    $uploadField1 = new UploadField($name = 'HeroImage', $title = 'Image');
    $uploadField1->setCanUpload(false);
    $fields->addFieldToTab('Root.Main', $uploadField1, 'Content');

    return $fields;
  }

}
class VineyardsPage_Controller extends Page_Controller {
  private static $allowed_actions = array (
  );

  public function init() {
    parent::init();
  }
}
