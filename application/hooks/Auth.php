<?php 

    class Auth extends CI_Controller
    {

        public function __construct ()
        {

            parent::__construct();

        }

        public function admin_auth ()
        {

            echo 'hook triggered';

        }


    }

?>