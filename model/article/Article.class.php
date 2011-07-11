<?php

namespace model\article;

use core\model\orm\wOrm;

/**
 * Classe Article
 * @method int getId()                  Returns the article's id
 * @method string getTitle()            Returns the article's title
 * @method string getHook()             Returns the article's hook
 * @method string getText()             Returns the article's text
 * @method boolean getIs_published()    Returns true if the article is published, false otherwise
 * @method string getCreate_date()      Returns the article's creation datetime
 * @method string getUpdate_date()      Returns the article's update datetime
 *
 * @method array getCommentaires()
 */
class Article extends wOrm
{
  /* Definition */
  protected $id;
  protected $title;
  protected $hook;
  protected $text;
  protected $is_published;
  protected $create_date;
  protected $update_date;

  public function __construct()
  {
    parent::__construct();

    $this->addRelation(wOrm::ONE_TO_MANY   , array('column' => 'id', 'foreignClass' => 'Commentaire', 'foreignColumn' => 'article_id'));
    $this->addRelation(wOrm::MANY_TO_MANY  , array('column' => 'id', 'foreignClass' => 'Tag', 'foreignColumn' => 'id', 'relationClass' => 'ArticleTag'));
  }

  /* Custom methods should come here */

  /**
   * @return boolean
   */
  public function isPublished()
  {
    return $this->getIs_published();
  }

  /**
   * @return int
   */
  public function getNbCommentaires()
  {
    return count($this->getCommentaires());
  }
}

