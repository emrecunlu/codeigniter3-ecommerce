<?php

    class Basket extends CI_Controller
    {

        public function __construct ()
        {
            
            parent::__construct ();

            $this -> load -> helper ('text');
            
        }

        public function index ()
        {

            $this -> load -> view ('basket');

        }

    }

?>