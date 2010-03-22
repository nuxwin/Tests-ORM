<?php

namespace core\model\db;

use core\model\sql\wSql;
use core\model\db\adapters\wDbAdapter;
use core\model\db\adapters\wCrudAdapter;
use core\model\db\adapters\wDataSourceAdapter;
use core\model\db\adapters\wTransactionAdapter;

/**
 * Classe wDb
 * Etend la classe abstraite wSql.
 * Implémente les interfaces wTransactionAdapter, wDataSourceAdapter et wCrudAdapter.
 * Permet de gérer la persistence des données contenues dans des objets.
 * Cette classe représente la DAO.
 *
 * @author William DURAND <william.durand1@gmail.com>
 */
class wDb extends wSql implements wTransactionAdapter, wDataSourceAdapter, wCrudAdapter
{
    /**
     * Objet DAL
     * @param wDbAdapter
     */
    private $_dataBase;

    public function __construct(wDbAdapter $db)
    { 
	$this->_dataBase = $db;
    }
	
    /**
     * @return wDbAdapter
     */
    private function _getDb()
    {
        return $this->_dataBase;
    }

    /**
     * @param array $criteria
     * @return string
     */
    private function _getWhere(array $criteria)
    {
        $result = array();
 
        foreach($criteria as $column => $value)
	{
            if(strpos($value, '*') !== false)
            {
                $result["{$column} LIKE "] = str_replace('*', '%', $value);
            }
            else
            {
                $result["{$column} = "] = $value;
            }
        }
 
        return $result;
    }
	
    /**
     * @param string $table_name
     * @return string
     */
    private function _getPrimaryKeyColumn($table_name)
    {
        $ret = null;
        $columns = $this->_getDb()->describeTable($table_name);
		
        foreach($columns as $column)
        {
            if($column['Key'] === 'PRI')
            {
                if(is_null($ret))
                {
                    $ret = $column['Field'];
                }
                else
                {
                    $ret = null;
                    break;
                }
            }
        }
 
        return $ret;
    }

    /**
     * @param object $object
     * @return array
     */
    protected function _getMembers($object)
    {
        $prop = array();

        $reflect = new \ReflectionObject($object);

        foreach($reflect->getProperties(\ReflectionProperty::IS_PROTECTED) as $var)
        {
            if(!$var->isStatic() && $var->getDeclaringClass()->getName() == get_class($object))
            {
                $prop[] = $var->getName();
            }
        }

        return $prop;
    }

    /**
     * @param object $object
     * @return array
     */
    protected function _getValues($object)
    {
        $values = array();

        foreach($this->_getMembers($object) as $attr)
        {
            $values[$attr] = $object->$attr;
        }

        return $values;
    }

    /**
     * Retourne un tableau d'objets.
     * @param object $object
     * @param array $criteria
     * @param array $order
     * @param integer $limit
     * @param integer $offset
     * @return array
     */
    public function find($object, $criteria = array(), $order = null, $limit = null, $offset = null)
    {
        $table_name = $object::getTableName();

        $select = $this->sqlSelect()->from($table_name);
 
        foreach($this->_getWhere($criteria) as $where => $value)
        {
            $select->where($where, $value);
        }
 
        if(count($order) > 0)
        {
            foreach($order as $col => $sens)
            {
                $select->orderBy($col, $sens);
            }
        }
 
        if ($limit !== null)
	{
            $select->limit($limit, $offset);
        }
        
        $stmt 	= $this->_getDb()->prepare($select->getRequest());
        $stmt->execute($select->getParameters());
        $result = $stmt->fetchAllObjectOfClass($object);
 
        return $result;
    }
	
    /**
    * Retourne le nombre d'objets comptés.
    * @param object $object
    * @param array $criteria
    * @return integer
    */
    public function count($object, $criteria = array())
    {
        $table_name = $object::getTableName();

        $select = $this->sqlSelect()->from(array('table_name' => $table_name, 'attr' => array('COUNT(*)')));
 
        foreach($this->_getWhere($criteria) as $where => $value)
        {
            $select->where($where, $value);
        }
 
        $stmt   = $this->_getDb()->prepare($select->getRequest());
        $stmt->execute($select->getParameters());
        $result = $stmt->fetchAll(\PDO::FETCH_ASSOC);
        
        return (integer)$result[0]['COUNT(*)'];
    }
	
    /**
     * Commencer une transaction.
     */
    public function beginTransaction()
    {
            $this->_getDb()->beginTransaction();
    }

    /**
     * Enregistrer les modifications.
     */
    public function commit()
    {
            $this->_getDb()->commit();
    }

    /**
     * Annuler les modifications.
     */
    public function rollBack()
    {
            $this->_getDb()->rollBack();
    }

    /**
     * Create a new object
     * @param object $object
     */
    public function create($object)
    {
        $table_name = $object::getTableName();
        $primaryKeyColumn = $this->_getPrimaryKeyColumn($table_name);

        $insert = $this->sqlInsert()->into($table_name);

        foreach($this->_getMembers($object) as $attr)
        {
            $insert->addValue($attr, $object->$attr);
        }

        try
        {
            $stmt = $this->_getDb()->prepare($insert->getRequest());
            $stmt->execute($insert->getParameters());
            $object->$primaryKeyColumn = $this->_getDb()->lastInsertId();
        }
        catch(\Exception $e)
        {
            echo '<pre>';
            echo $e->getMessage();
            echo '<br />';
            echo '<br />';
            echo $insert->getRequest();
            echo '<br />';
            echo '<br />';
            echo $e->getTraceAsString();
            echo '</pre>';
        }
    }

    /**
    * Read an object
    * @param object $object
    */
    public function read($object)
    {
        throw new Exception('Not yet implemented (probably never...)');
    }

    /**
    * Update an object
    * @param object $object
    */
    public function update($object)
    {
        $table_name = $object::getTableName();
        $primaryKeyColumn = $this->_getPrimaryKeyColumn($table_name);

        $update = $this->sqlUpdate()->from($table_name);

        $data = $this->_getValues($object);
        
        $updateData = $data;
        unset($updateData[$primaryKeyColumn]);

        foreach($updateData as $attr => $value)
        {
            $update->addSet($attr, $value);
        }

        $update->where($primaryKeyColumn, $data[$primaryKeyColumn]);

        try
        {
            $stmt = $this->_getDb()->prepare($update->getRequest());
            $stmt->execute($update->getParameters());
        }
        catch(\Exception $e)
        {
            echo '<pre>';
            echo $e->getMessage();
            echo '<br />';
            echo '<br />';
            echo $update->getRequest();
            echo '<br />';
            echo '<br />';
            echo $e->getTraceAsString();
            echo '</pre>';
        }
    }

    /**
    * Delete an object
    * @param object $object
    */
    public function delete($object)
    {
        $table_name = $object::getTableName();
        $primaryKeyColumn = $this->_getPrimaryKeyColumn($table_name);

        $data = $this->_getValues($object);
        
        $delete = $this->sqlDelete()->from($table_name)->where($primaryKeyColumn, $data[$primaryKeyColumn]);

        try
        {
            $stmt = $this->_getDb()->prepare($delete->getRequest());
            $stmt->execute($delete->getParameters());
        }
        catch(\Exception $e)
        {
            echo '<pre>';
            echo $e->getMessage();
            echo '<br />';
            echo '<br />';
            echo $delete->getRequest();
            echo '<br />';
            echo '<br />';
            echo $e->getTraceAsString();
            echo '</pre>';
        }
    }
}

?>