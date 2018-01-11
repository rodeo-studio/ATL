<?php
class AboutElement extends DataObject {
  private static $db = array(
    'SortID'=>'Int',
    'Type'=>'Int',
    'BackgroundColour'=>'Int',
    'Content' => 'HTMLText',
    'Quote' => 'Text',
    'QuoteCredit' => 'Text',
    'ImageCredit' => 'Text'
  );

  private static $has_one = array(
    'About' => 'AboutPage',
    'HeroImage' => 'Image'
  );

  public function FormatType() { 
    $source = array("Text", "Quote", "Image", "Image (Wide)");

    return $source[$this->Type]; 
  }

  public function FormatBackground() { 
    $source = array("Light", "Dark");

    return $source[$this->BackgroundColour]; 
  }

  public static $summary_fields = array( 
    'FormatType' => 'Type',
    'FormatBackground' => 'BackgroundColour'
  );
  
  private static $default_sort = "SortID ASC";
  
  function getCMSFields() {
    $typeField = new OptionsetField(
      $name = "Type",
      $title = "Type",
      $source = array("Text", "Quote", "Image", "Image (Wide)"),
      $value = 0
    );

    $backgroundField = new OptionsetField(
      $name = "BackgroundColour",
      $title = "Background Colour",
      $source = array("Light", "Dark"),
      $value = 0
    );

    $uploadImageField = new UploadField($name = 'HeroImage', $title = 'Image');
    $uploadImageField->setCanUpload(false);

    $fields = new FieldList (
      $typeField, 
      $backgroundField,
      new LiteralField ('literalfield', '<strong>Text</strong>'),
      new HtmlEditorField('Content', 'Content'),
      new LiteralField ('literalfield', '<strong>Quote Text</strong>'),
      new TextField('Quote', 'Quote'),
      new TextField('QuoteCredit', 'Credit'),
      new LiteralField ('literalfield', '<strong>Element Image</strong>'),
      $uploadImageField,
      new TextField('ImageCredit', 'Caption')
    );

    return $fields; 
  }
}
