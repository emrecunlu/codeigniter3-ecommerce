<?php 

    class Register extends CI_Controller
    {

        public function __construct()
        {
            
            parent::__construct ();

            if ( $this -> session -> has_userdata ('login_user'))
                redirect ( base_url('hesap-ayarlari'));

        }

        public function index ()
        {

            $this -> load -> view ('register');

        }

    }

?>