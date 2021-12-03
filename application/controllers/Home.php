<?php 

    class Home extends CI_Controller
    {

        public function __construct()
        {
            
            parent::__construct ();

            $this -> load -> model ('Product_model', 'product');

            $this -> load -> helper ('text');
            
        }

        public function index ()
        {

            $this -> load -> view ('home', array (
                'products' => $this -> product -> get_all ([
                    'is_live' => 1
                ], 20)
            ));

        }

    }

?>