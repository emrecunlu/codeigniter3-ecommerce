<?php 

    class Payment_model extends CI_Model
    {

        private $table_name = 'orders';

        public function __construct()
        {
            
            parent::__construct ();

        }

        public function add ($data)
        {

            $payment = $this -> db
                             -> insert_batch ($this -> table_name, $data);

            if ( $this -> db -> affected_rows () > 0 ) return true;

            return false;

        }

    }

?>