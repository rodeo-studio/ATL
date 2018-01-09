<?php
class VineyardElement extends DataObject {
  private static $db = array(
    'SortID'=>'Int',
    'Anchor' => 'Text',
    'Title' => 'Text',
    'Grower' => 'Text',
    'Location' => 'Text',
    'Content' => 'HTMLText'
  );

  private static $has_one = array(
    'Vineyards' => 'VineyardsPage',
    'HeroImage' => 'Image'
  );


  public function FormatContent() { 
    return $this->Title; 
  }

  public static $summary_fields = array( 
    'FormatContent' => 'Title'
  );
  
  private static $default_sort = "SortID ASC";
  
  function getCMSFields() {
    $uploadImageField = new UploadField($name = 'HeroImage', $title = 'Hero Image');
    $uploadImageField->setCanUpload(false);

    $fields = new FieldList (
      new TextField('Anchor', 'Page Anchor'),
      new TextField('Title', 'Title'),
      new TextField('Grower', 'Grower'),
      new TextField('Location', 'Location'),
      new HtmlEditorField('Content', 'Content'),
      $uploadImageField
    );

    return $fields; 
  }
}
