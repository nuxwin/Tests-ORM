<?php

namespace core\model\sql;

/**
 * Classe wSql.
 * Cette classe représente la couche SQL de la DAL.
 *
 * @author William DURAND <william.durand1@gmail.com>
 */
abstract class wSql
{
  /**
   * @return wSqlSelect
   */
  public function sqlSelect()
  {
    return new wSqlSelect();
  }

  /**
   * @return wSqlUpdate
   */
  public function sqlUpdate()
  {
    return new wSqlUpdate();
  }

  /**
   * @return wSqlDelete
   */
  public function sqlDelete()
  {
    return new wSqlDelete();
  }

  /**
   * @return wSqlInsert
   */
  public function sqlInsert()
  {
    return new wSqlInsert();
  }
}

