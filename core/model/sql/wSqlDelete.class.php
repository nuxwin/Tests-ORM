<?php

namespace core\model\sql;

use core\model\sql\wSqlAbstract;

/**
 * Classe wSqlDelete
 * Construit une requête SQL du type DELETE.
 *
 * @author William DURAND <william.durand1@gmail.com>
 */
class wSqlDelete extends wSqlAbstract
{
  /**
   * @var string
   */
  private $from;
  /**
   * @var array
   */
  private $where = array();

  /**
   * @return wSqlDelete
   */
  public function from($table_name)
  {
    $this->from = $table_name;

    return $this;
  }

  /**
   * @return wSqlDelete
   */
  public function where($attr, $value)
  {
    if(!empty($value))
    {
      $this->where[$attr] = $value;
    }

    return $this;
  }

  /**
   * Termine la construction de la requête et la retourne.
   * @return string
   */
  protected function _build()
  {
    if(is_null($this->request))
    {
      $str = 'DELETE FROM ';
      $str .= $this->from;

      if(count($this->where) > 0)
      {
        $str .= ' WHERE ';

        $where = '';
        foreach($this->where as $attr => $value)
        {
          if(!empty($value))
          {
            if(!empty($where))
            {
              $where .= ' AND ';
            }

            $where .= $attr . ' = ?';
            $this->parameters[] = $value;
          }
        }

        $str .= $where;
      }

      $this->request = $str;
    }
  }
}

