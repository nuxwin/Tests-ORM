<?php

namespace core\model\db\adapters;

/**
 * Interface wCrudAdapter
 * Description du besoin CRUD :
 * - Create
 * - Read
 * - Update
 * - Delete
 *
 * @author William DURAND <william.durand1@gmail.com>
 */
interface wCrudAdapter
{
    /**
     * Create a new object
     * @param object $object
     */
    public function create($object);
    /**
    * Read an object
    * @param object $object
    */
    public function read($object);
    /**
    * Update an object
    * @param object $object
    */
    public function update($object);
    /**
    * Delete an object
    * @param object $object
    */
    public function delete($object);
}

?>