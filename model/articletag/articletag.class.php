<?php

namespace model\articletag;

use core\model\orm\wOrm;

/**
 * Classe ArticleTag
 * @method int getTagId()       Returns the tag's id
 * @method int getArticleId()   Returns the article's id
 */
class ArticleTag extends wOrm
{
    protected static $_tableName = 'article_tag';

    protected $tag_id;
    protected $article_id;
    
    public function __construct()
    {
        parent::__construct();
    }

    /* Custom methods should come here */
    
}

?>