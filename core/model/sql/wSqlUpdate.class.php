<?php

namespace core\model\sql;

use core\model\sql\wSqlAbstract;

/**
 * Classe wSqlUpdate
 * Construit une requête SQL du type UPDATE.
 *
 * @author William DURAND <william.durand1@gmail.com>
 */
class wSqlUpdate extends wSqlAbstract
{
  /**
   * @var string
   */
  private $from;
  /**
   * @var array
   */
  private $set = array();
  /**
   * @var array
   */
  private $where = array();

  /**
   * @return wSqlUpdate
   */
  public function from($table_name)
  {
    $this->from = $table_name;

    return $this;
  }

  /**
   * @return wSqlUpdate
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
   * @return wSqlUpdate
   */
  public function addSet($attr, $value)
  {
    if(!empty($value))
    {
      $this->set[$attr] = $value;
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
      $str = 'UPDATE ';
      $str .= $this->from;
      $str .= ' SET ';

      $set = array();
      foreach($this->set as $attr => $value)
      {
        if(!empty($value))
        {
          $set[] = $attr . ' = ?';

          $this->parameters[] = $value;
        }
      }

      $str .= implode(',', $set);

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

