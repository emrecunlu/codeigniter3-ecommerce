<?php 

    class UserSettings extends CI_Controller
    {

        public function __construct()
        {
        
            parent::__construct ();
            
            if ( !$this -> session -> has_userdata ('login_user')) 
                redirect ( base_url('giris-yap'));
            
             $this -> load -> model ('User_model', 'user');

        }

        public function index ()
        {
            
            $user_id = $this -> session -> userdata ('login_user')['user_id'];

            $user = $this -> user -> get (array ('user_id' => $user_id)) -> row ();

            $this -> load -> view ('user-detail', array (
                'user' => $user
            ));

        }

    }

?>