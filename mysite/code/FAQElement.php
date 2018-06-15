<?php
class FAQElement extends DataObject {
  private static $db = array(
    'SortID'=>'Int',
    'Title' => 'Text',
    'Content' => 'HTMLText'
  );

  private static $has_one = array(
  );

  public function FormatContent() { 
    return $this->Title; 
  }

  public static $summary_fields = array( 
    'FormatContent' => 'Content'
  );
  
  private static $default_sort = "SortID ASC";
  
  function getCMSFields() {
    $fields = new FieldList (
      new TextField('Title', 'Title'), 
      new HtmlEditorField('Content', 'Content')
    );

    return $fields; 
  }
}
