<?php

namespace test;

/* Core */
use core\model\db\wDb;
use core\model\pdo\wPdo;
use core\model\orm\wOrm;

/* Models */
use model\tag\Tag;
use model\article\Article;
use model\commentaire\Commentaire;

/* Defines the autoload function */
spl_autoload_register(function($class) {
    $tab    = explode('\\', $class);
    $path   = implode(DIRECTORY_SEPARATOR, $tab) . '.class.php';

    if(file_exists($path))
    {
        include_once($path);
        return true;
    }

    throw new \Exception('Cannot load : ' . $class);
});

try {
    /* Sets the connection */
    $pdo = new wPdo('mysql:host=localhost;dbname=tests_orm', 'root', 'root');
    $db  = new wDb($pdo);
    wOrm::setDataSource($db);

    /* Tests */
    echo '<b>Database overview :</b>';
    echo '<br />';
    echo '- ' . Article::count() . ' article(s)';
    echo '<br />';
    echo '- ' . Commentaire::count() . ' commentaire(s)';
    echo '<br />';
    echo '- ' . Tag::count() . ' tag(s)';
    echo '<br />';

    $article = Article::findOne(array('id' => 1));

    echo '<br />';
    echo 'L\'article intitul&eacute; "';
    echo $article->getTitle();
    echo '" comporte ';
    echo $article->getNbCommentaires();
    echo ' commentaire(s).';

    echo '<br />';
    echo '<br />';

    echo '<b>Create a new \'Commentaire\' :</b>';
    echo '<br />';

    $comment                = new Commentaire();
    $comment->author        = 'William';
    $comment->message       = 'Hi ! How are you ? That\'s pretty cool ! =P';
    $comment->is_published  = 1;
    $comment->save();

    echo 'It got the id : ' . $comment->getId() . '.';

    echo '<br />';
    echo '<br />';
    echo '<b>Gonna retrieve it...</b>';
    echo '<br />';

    $a_comment = Commentaire::findOne(array('id' => $comment->getId()));
    echo $a_comment->getMessage() . ' <em>by ' . $a_comment->getAuthor() . '</em>.';

    echo '<br />';
    echo '<br />';
    echo '<b>Playing with relations :</b>';
    echo '<br />';
    echo 'Adds two comments to our article (1-N relation) : how many comments has it ?';
    echo '<br />';

    $comment2                = new Commentaire();
    $comment2->author        = 'William (again)';
    $comment2->message       = 'Hi ! This comment will not be registered until the article be saved.';
    $comment2->is_published  = 1;

    echo 'Before: ' . $article->getNbCommentaires();
    echo '<br />';

    $article->setCommentaires(array($comment, $comment2));

    echo 'After: ' . $article->getNbCommentaires();
    echo '<br />';
    echo '<br />';
    echo 'Comment\'s article :';
    echo '<br />';
    echo '<ul>';

    foreach($article->getCommentaires() as $c) {
        echo '<li>' . $c->getAuthor() . ' <i>said</i> ' . $c->getMessage() . '</li>';
    }

    echo '</ul>';
    echo '<br />';
    echo '<b>And now ?</b>';
    echo '<br />';

    echo '- ' . Article::count() . ' article(s)';
    echo '<br />';
    echo '- ' . Commentaire::count() . ' commentaire(s)';
    echo '<br />';
    echo '- ' . Tag::count() . ' tag(s)';
    echo '<br />';
    echo '<br />';

    echo '<b>Delete the comment !</b>';

    $comment->delete();

    echo '<br />';
    echo '<br />';
    echo '<b>The end !</b>';
    echo '<br />';

    echo '- ' . Article::count() . ' article(s)';
    echo '<br />';
    echo '- ' . Commentaire::count() . ' commentaire(s)';
    echo '<br />';
    echo '- ' . Tag::count() . ' tag(s)';
    echo '<br />';
    echo '<br />';

} catch(\Exception $e) {
    echo 'Ooops! ' . $e->getMessage() . '<br />';
}
