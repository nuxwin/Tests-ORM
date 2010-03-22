<?php

namespace core\model\db\adapters;

/**
 * Interface wTransactionAdapter
 * Décrit les méthodes nécessaires à l'utilisation des Transactions.
 *
 * @author William DURAND <william.durand1@gmail.com>
 */
interface wTransactionAdapter
{
    /**
     * Commencer une transaction.
     */
    public function beginTransaction();
    /**
     * Enregistrer les modifications.
     */
    public function commit();
    /**
     * Annuler les modifications.
     */
    public function rollBack();
}

?>