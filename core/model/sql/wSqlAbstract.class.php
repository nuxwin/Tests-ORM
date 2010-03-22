<?php

namespace core\model\sql;

/**
 * Classe wSqlAbstract.
 *
 * @author William DURAND <william.durand1@gmail.com>
 */
abstract class wSqlAbstract
{
    /**
     * @var string
     */
    protected $request = null;
    /**
     * @var array
     */
    protected $parameters = array();

    /**
     * @return string
     */
    public function getRequest()
    {
        $this->_build();

        return $this->request;
    }

    /**
     * @return array
     */
    public function getParameters()
    {
        $this->_build();

        return $this->parameters;
    }

    /**
     * Termine la construction de la requête et la retourne.
     * @return string
     */
    protected abstract function _build();
}

?>