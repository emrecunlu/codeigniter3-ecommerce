<?php 

    class Adress_model extends CI_Model
    {

        private $table_name = 'user_adress';

        public function __construct()
        {
            
            parent::__construct ();

        }

        public function add ($data)
        {

            $new_adress = $this -> db
                                -> insert ($this -> table_name, $data);

            if ( $this -> db -> affected_rows () > 0) return true;

            return false;

        }

        public function get_all ($where)
        {

            $adresses = $this -> db
                              -> join ('cities', 'cities.sehir_id = user_adress.user_city', 'inner')
                              -> join ('counties', 'counties.ilce_id = user_adress.user_district')
                              -> get_where ( $this -> table_name, $where)
                              -> result ();

            return $adresses;

        }

        public function get ($where)
        {

            $adress = $this -> db
                            -> get_where ($this -> table_name, $where)
                            -> row ();

            return $adress;

        }

    }

?>