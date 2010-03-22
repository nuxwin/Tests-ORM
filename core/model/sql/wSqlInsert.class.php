<?php

namespace core\model\sql;

use core\model\sql\wSqlAbstract;

/**
 * Classe wSqlInsert
 * Construit une requête SQL du type INSERT.
 *
 * @author William DURAND <william.durand1@gmail.com>
 */
class wSqlInsert extends wSqlAbstract
{
    /**
     * @var string
     */
    private $into;
    /**
     * @var array
     */
    private $values = array();
    
    /**
     * @return wSqlInsert
     */
    public function into($table_name)
    {
        $this->into = $table_name;
    
        return $this;
    }
    
    /**
     * @return wSqlInsert
     */
    public function addValue($attr, $value)
    {
            if(!empty($value))
            {
                $this->values[$attr] = $value;
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
            $str = 'INSERT INTO ';
            $str .= $this->into;

            $values = array();
            $attributes = array();
            foreach($this->values as $attr => $value)
            {
                if(!empty($value))
                {
                    $values[] = '?';
                    $attributes[] = $attr;
                
                    $this->parameters[] = $value;
                }
            }

            $str .= '(' . implode(',', $attributes) . ')';
            $str .= ' VALUES';
            $str .= '(' . implode(',', $values) . ')';
            
            $this->request = $str;
        }
    }
}

?>