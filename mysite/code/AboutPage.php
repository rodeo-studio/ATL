<?php
class AboutPage extends Page {

  private static $db = array(
    'BaseImageParallax' => 'Boolean',
    'BaseImageCaption' => 'Text'
  );

  private static $has_many = array(
    'AboutElements' => 'AboutElement'
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

    // Hero Image
    $fields->addFieldToTab('Root.Main', new LiteralField('literalfield', '<strong>Hero Image</strong>')); 
    $uploadHeroField = new UploadField($name = 'HeroImage', $title = 'Image');
    $uploadHeroField->setCanUpload(false);
    $fields->addFieldToTab('Root.Main', $uploadHeroField);

    // Elements
    $config = GridFieldConfig_RelationEditor::create();
    $config->removeComponentsByType('GridFieldPaginator');
    $config->removeComponentsByType('GridFieldPageCount');
    $config->addComponent(new GridFieldSortableRows('SortID'));
    $aboutElementField = new GridField(
      'AboutElements', // Field name
      'About Element', // Field title
      $this->AboutElements(),
      $config
    );
    $fields->addFieldToTab('Root.Main', $aboutElementField); 

    // Base Image
    $fields->addFieldToTab('Root.Main', new LiteralField('literalfield', '<strong>Base Image</strong>')); 
    $uploadField1 = new UploadField($name = 'BaseImage', $title = 'Image');
    $uploadField1->setCanUpload(false);
    $fields->addFieldToTab('Root.Main', $uploadField1);
    $fields->addFieldToTab("Root.Main", new CheckboxField ('BaseImageParallax', 'Enable Parallax'));
    $fields->addFieldToTab('Root.Main', new TextField('BaseImageCaption', 'Caption'));

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
class AboutPage_Controller extends Page_Controller {
  private static $allowed_actions = array (
  );

  public function init() {
    parent::init();
  }
}
