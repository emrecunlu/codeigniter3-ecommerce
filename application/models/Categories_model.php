<?php 

    class Categories_model extends CI_Model
    {

        private $table_name = 'categories';

        public function __construct()
        {
            
            parent::__construct ();

        }

        public function get_all ()
        {

            $categories = $this -> db
                                -> get_where ($this -> table_name)
                                -> result ();
            
            return $categories;

        }

        public function insert ( $data)
        {

            $added = $this -> db
                           -> insert ( $this -> table_name, $data);

            if ( $this -> db -> affected_rows() > 0) return true;

            return false;

        }

        public function get ($where)
        {
        
            $category = $this -> db
                              -> get_where ($this -> table_name, $where);
                              
            return $category;

        }

    }

?>