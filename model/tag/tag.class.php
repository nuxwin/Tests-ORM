<?php

namespace model\tag;

use core\model\orm\wOrm;

/**
 * Classe Tag
 * @method int getId()        Returns the tag's id
 * @method string getName()   Returns the tag's name
 */
class Tag extends wOrm
{
  /* Definition */
  protected $id;
  protected $name;

  public function __construct()
  {
    parent::__construct();
  }

  /* Custom methods should come here */

}

