<?php 

    class Slide_model extends CI_Model
    {

        private $table_name = 'slider';

        public function __construct()
        {
            
            parent::__construct ();

        }

        public function get ($id)
        {

            return $this -> db
                         -> get_where ( $this -> table_name, array ( 'slider_id' => $id))
                         -> row ();

        }

        public function insert ($data)
        {

            $added = $this -> db    
                           -> insert ( $this -> table_name, $data);
                           
            if ( $this -> db -> affected_rows() > 0) return true;

            return false;

        }

    }

?>