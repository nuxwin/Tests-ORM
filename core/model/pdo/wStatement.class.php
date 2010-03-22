<?php

namespace core\model\pdo;

/**
 * Replacement of PDOStatement
 * Allow fetchObjectOfClass() and fetchAllObjectOfClass()
 * 
 * @author Julien PAULI
 * @author William DURAND <william.durand1@gmail.com>
 * 
 * Code original de Julien PAULI, modifié pour wMVC
 * Cette classe fait partie de la DAL.
 */
final class wStatement extends \PDOStatement
{
    /**
     * wPdo instance, passed to classes allowed by
     * fetchObjectOfClass() and fetchAllObjectOfClass()
     *
     * @var wPdo
     */
    private static $_pdo;
    
    /**
     * PDOStatement doesn't allow a public constructor
     * probably due to internal job. However, we need a way
     * to pass the wPdo instance to us.
     *
     * @param wPdo $pdo
     */
    public static function setPDOInstance(wPdo $pdo)
    {
        self::$_pdo = $pdo;
    }
    
    /**
     * Internal stuff to check for class validity and
     * discovering of table name
     *
     * @param string $className
     * @throws \PDOException
     * @return array
     */
    private function _prepareFetchObject($className)
    {
        if (!preg_match("/.*FROM\s(.*?)[\s|;]/i", $this->queryString, $table))
        {
            throw new \PDOException('Could not find table name in query');
        }
        
        if (!class_exists($className, true))
	{
            throw new \PDOException('Class '.$className.' does not exist');
        }
        
        $reflection = new \ReflectionClass($className);
        
        if (!$reflection->isSubclassOf('\core\model\orm\wOrm'))
	{
            throw new \PDOException('Class '.$className.' should extend \core\model\orm\wOrm');
        }
        
        return $table;
    }
    
    /**
     * Fetch a result as an object of a class extending
     * wResults. Those class should allow their objects
     * to be saved back to the DB.
     *
     * @param string $className
     * @return wResultObjects
     */
    public function fetchObjectOfClass($className)
    {
        $table = $this->_prepareFetchObject($className);

        $instance = new $className();
        $this->setFetchMode(\PDO::FETCH_INTO, $instance);

        return parent::fetch(\PDO::FETCH_INTO);
    
    }
    
     /**
     * Fetch a result as an object of a class extending
     * wResults. Those class should allow their objects
     * to be saved back to the DB.
     *
     * @param string $className
     * @return wResultObjects
     */
    public function fetchAllObjectOfClass($className)
    {
        $table = $this->_prepareFetchObject($className);

        return parent::fetchAll(\PDO::FETCH_CLASS, $className);
    }
    
    public function __call($method, $args)
    {
        if(preg_match("/^fetchAll(\w+)$/", $method, $matches))
	{
            return $this->fetchAllObjectOfClass($matches[1]);
        }
	elseif(preg_match("/^fetchOne(\w+)$/", $method, $matches))
	{
            return $this->fetchObjectOfClass($matches[1]);
        }
	else
	{
            trigger_error('Call to undefined method '.$matche[1], E_USER_ERROR);
        }
    }
}

?>