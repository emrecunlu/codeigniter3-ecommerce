<?php

    class Visitor_model extends CI_Model
    {

        private $table_name = 'visitors';

        public function __construct()
        {
            parent::__construct();
        }

        public function insert($data)
        {
            return $this -> db
                         -> insert($this -> table_name, $data);
        }

    }

?>