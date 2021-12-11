<?php 

    class Place_model extends CI_Model
    {

        public function __construct()
        {
            
            parent::__construct ();

        }

        public function get_cities ($where = array ())
        {

            $counties = $this -> db
                              -> from ('cities')
                              -> where ($where)  
                              -> get () 
                              -> result ();

            return $counties;

        }

        public function get_counties ($city_id)
        {

            $counties = $this -> db
                              -> get_where ('counties', array (
                                  'ilce_sehirkey' => $city_id
                              ))
                              -> result ();

            return $counties;

        }

    }

?>