<?php 

    class User_model extends CI_Model
    {

        private $table_name = 'users';

        public function __construct ()
        {
         
            parent::__construct ();
            
        }

        public function get ($where)
        {

            $user = $this -> db
                          -> get_where ($this -> table_name, $where);

            return $user;

        }

        public function add ($data)
        {

            $add_user = $this -> db
                              -> insert ($this -> table_name, $data);

            if ( $this -> db -> affected_rows () > 0 ) return true;

            return false;

        }

        public function update ($id, $data)
        {

            $update_user = $this -> db
                                 -> where ('user_id', $id)
                                 -> update ($this -> table_name, $data);

            if ( $this -> db -> affected_rows () > 0) return true;

            return false;

        }

    }

?>