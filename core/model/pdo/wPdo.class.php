<?php

namespace core\model\pdo;

use core\model\pdo\wStatement;
use core\model\db\adapters\wDbAdapter;

/**
 * Classe wPdo
 * Code original de Julien PAULI, modifié pour wMVC.
 *
 * Cette classe étend la classe PDO et implémente l'interface wDbAdapter.
 * C'est l'implémentation de la DAL.
 *
 * @author Julien PAULI
 * @author William DURAND <william.durand1@gmail.com>
 */
class wPdo extends \PDO implements wDbAdapter
{
  /**
   * Constructor.
   * Enables PDOExceptions
   * Initiates wStatement
   *
   * @param string $dsn
   * @param string $username
   * @param string $password
   * @param array $driver_options
   */
  final public function __construct($dsn, $username = '', $password = '', $driver_options = array())
  {
    parent::__construct($dsn, $username, $password, $driver_options);        
    $this->setAttribute(self::ATTR_ERRMODE, self::ERRMODE_EXCEPTION);
    $this->setAttribute(self::ATTR_STATEMENT_CLASS, array('core\model\pdo\wStatement'));
    wStatement::setPDOInstance($this);
  }

  /**
   * Exécute une requête.
   * @param string $query
   */
  public function exec($query)
  {
    //        echo '<br />'.$query;

    return parent::exec($query);
  }

  /**
   * Interroge la base de données.
   */
  public function query($query)
  {
    //        echo '<br />'.$query;

    return parent::query($query);
  }

  /**
   * Retourne une description de la table de base de données spécifiée.
   * @param string $table_name
   * @return array
   */
  public function describeTable($table_name)
  {
    $sql        = sprintf('DESCRIBE %s', $table_name);
    $statment   = $this->prepare($sql);

    $statment->execute();

    return $statment->fetchAll(\PDO::FETCH_ASSOC);
  }
}

