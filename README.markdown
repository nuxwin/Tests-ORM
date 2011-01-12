wORM : simple ORM implementation in PHP
=========================================================================

This is a prood of concept written in PHP during my degree in computer science (PHP lecture).

Features
--------------
* Active Record implementation
* Relations management
* Written in PHP 5.3
* Use objects to write SQL requests
* Magic finders like : findByTitle(...), findOneByTitle(...), countByTitle(...), findByTitleAndDescription(...)
  /!\ not Or condition
* Automatic getters and setters
* Finders with criterias

Usage
--------------
A model object is a simple class with attributes and a constructor that initialize relations as needed.

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

Here we have an `Article` class and two relations following this diagram :

<pre>
Commentaire * --------------- 1 Article * --------------- * Tag
</pre>

You can easily add your methods after. Note that getters/setters are generated for each attribute (like `getTitle()` or `setTitle()`).
Note again that there is no way to generate database interactions so you have to create your database and tables yourself.
A table name should be the lowercased class name. Each column table name should be the respective attribute name.

What about the example script ?
--------------------------------
There is an `index.php` file that show you how it works.
Create a database with the given file `database.sql`, set up your database parameters into the `index.php` file and run it from your favorite browser.

Todo
----------
* Rewrite doc blocks in english...
* Improve configuration, finders and SQL builder

Link
-----------
My blog post on [www.willdurand.fr](http://www.willdurand.fr/implementation-en-php-53-des-concepts-orm-dal-dao-crud/).
