<?php

    class Admin_model extends CI_Model
    {

        private $table_name = 'admins';

        public function __construct()
        {

            parent::__construct ();

        }

        public function get ($where)
        {

            return $this -> db
                         -> get_where ( $this -> table_name, $where)
                         -> row ();

        }

    }

?>
