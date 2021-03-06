<?php
class ProductPage extends Page {

  private static $db = array(
  );

  private static $has_many = array(
  );

  private static $has_one = array(
  );

  function getCMSFields() {
    $fields = parent::getCMSFields();

    // remove fields
    $fields->removeFieldFromTab('Root.Main', 'Content');

    return $fields;
  }

}
class ProductPage_Controller extends Page_Controller {
  private static $allowed_actions = array (
  );

  public function init() {
    parent::init();

    if ($this->getRequest()->param('ProductID')) {
      $this->ProductID = $this->getRequest()->param('ProductID');
    }

    $this->ProductPage = DataObject::get_one("ProductPage");
    $this->Title = $this->ProductPage->Title;
  }

  public function index($request) {
    return $this->renderWith('ProductPage');
  }
}
