<?php
class JournalPage extends Page {

  private static $db = array(
    'JournalDate' => 'Date',
    'Synopsis' => 'Text'
  );

  private static $has_many = array(
  );

  private static $has_one = array(
    'HeroImage' => 'Image'
  );

  function getCMSFields() {
    $fields = parent::getCMSFields();

    $dateField = new DateField('JournalDate', 'Date');
    $dateField->setConfig('showcalendar', true);
    $fields->addFieldToTab('Root.Main', $dateField, 'Content');

    $uploadField1 = new UploadField($name = 'HeroImage', $title = 'Image');
    $uploadField1->setCanUpload(false);
    $fields->addFieldToTab('Root.Main', $uploadField1, 'Content');

    $fields->addFieldToTab('Root.Main', new TextField('Synopsis', 'Synopsis'), 'Content');

    return $fields;
  }

}
class JournalPage_Controller extends Page_Controller {
  private static $allowed_actions = array (
  );

  public function init() {
    parent::init();
  }

  public function FirstLastPage($Mode = 'first') {
    if($Mode == 'first'){
      $Where = "ParentID = ($this->ParentID)";
      $Sort = "Sort ASC"; 
    }
    elseif($Mode == 'last'){
      $Where = "ParentID = ($this->ParentID)";
      $Sort = "Sort DESC";
    } 
    else {
      return false; 
    } 
    return DataObject::get("SiteTree", $Where, $Sort, null, 1);
  }
    
  public function PrevNextPage($Mode = 'next') {
    if($Mode == 'next'){
      $Where = "ParentID = ($this->ParentID) AND Sort > ($this->Sort)";
      $Sort = "Sort ASC";
    } 
    elseif($Mode == 'prev'){ 
      $Where = "ParentID = ($this->ParentID) AND Sort < ($this->Sort)";
      $Sort = "Sort DESC";
    } 
    else{ 
      return false; 
    }
    return DataObject::get("SiteTree", $Where, $Sort, null, 1);
  }
}
