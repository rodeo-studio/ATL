<?php
class HomePage extends Page {

  private static $db = array(
    'SocialFacebook' => 'Text',
    'SocialInstagram' => 'Text',
    'SocialTwitter' => 'Text',
    'SocialEmail' => 'Text',
    'Quote' => 'Text',
    'BaseImageParallax' => 'Boolean',
    'BaseImageCaption' => 'Text',
    'PageLink1Synopsis' => 'Text',
    'PageLink2Synopsis' => 'Text'
  );

  private static $has_many = array(
  );

  private static $has_one = array(
    'HeroImage' => 'Image',
    'BaseImage' => 'Image',
    'PageLink1' => 'SiteTree',
    'PageLinkImage1' => 'Image',
    'PageLink2' => 'SiteTree',
    'PageLinkImage2' => 'Image',
    'PageExtraLink1' => 'SiteTree',
    'PageExtraLinkImage1' => 'Image',
    'PageExtraLink2' => 'SiteTree',
    'PageExtraLinkImage2' => 'Image'
  );

  function getCMSFields() {
    $fields = parent::getCMSFields();

    // remove fields
    $fields->removeFieldFromTab('Root.Main', 'Content');

    $fields->addFieldToTab('Root.Social', new TextField('SocialFacebook', 'Facebook URL'));
    $fields->addFieldToTab('Root.Social', new TextField('SocialInstagram', 'Instagram URL'));
    $fields->addFieldToTab('Root.Social', new TextField('SocialTwitter', 'Twitter URL'));
    $fields->addFieldToTab('Root.Social', new TextField('SocialEmail', 'Email address'));

    // Hero Image
    $fields->addFieldToTab('Root.Main', new LiteralField('literalfield', '<strong>Hero Image</strong>')); 
    $uploadHeroField = new UploadField($name = 'HeroImage', $title = 'Image');
    $uploadHeroField->setCanUpload(false);
    $fields->addFieldToTab('Root.Main', $uploadHeroField);

    $fields->addFieldToTab('Root.Main', new TextField('Quote', 'Quote'));

    // Base Image
    $fields->addFieldToTab('Root.Main', new LiteralField('literalfield', '<strong>Base Image</strong>')); 
    $uploadField1 = new UploadField($name = 'BaseImage', $title = 'Image');
    $uploadField1->setCanUpload(false);
    $fields->addFieldToTab('Root.Main', $uploadField1);
    $fields->addFieldToTab("Root.Main", new CheckboxField ('BaseImageParallax', 'Enable Parallax'));
    $fields->addFieldToTab('Root.Main', new TextField('BaseImageCaption', 'Caption'));

    // Page links
    $fields->addFieldToTab('Root.PageLinks', new LiteralField('literalfield', '<strong>Page Link 1</strong>'));
    $fields->addFieldToTab('Root.PageLinks', new TreeDropdownField('PageLink1ID', 'Page', 'Page'));
    $fields->addFieldToTab('Root.PageLinks', new TextField('PageLink1Synopsis', 'Synopsis'));
    $uploadPageLinkField1 = new UploadField($name = 'PageLinkImage1', $title = 'Image');
    $uploadPageLinkField1->setCanUpload(false);
    $fields->addFieldToTab('Root.PageLinks', $uploadPageLinkField1);

    $fields->addFieldToTab('Root.PageLinks', new LiteralField('literalfield', '<strong>Page Link 2</strong>'));
    $fields->addFieldToTab('Root.PageLinks', new TreeDropdownField('PageLink2ID', 'Page', 'Page'));
    $fields->addFieldToTab('Root.PageLinks', new TextField('PageLink2Synopsis', 'Synopsis'));
    $uploadPageLinkField2 = new UploadField($name = 'PageLinkImage2', $title = 'Image');
    $uploadPageLinkField2->setCanUpload(false);
    $fields->addFieldToTab('Root.PageLinks', $uploadPageLinkField2);

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
class HomePage_Controller extends Page_Controller {
  private static $allowed_actions = array (
  );

  public function init() {
    parent::init();
  }
}
