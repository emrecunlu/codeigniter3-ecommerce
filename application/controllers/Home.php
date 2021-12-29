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

            $data ['products'] = $this -> product -> get_all ( [ 'is_live' => 1], 20);

            $data ['best_sellers'] = $this -> product -> get_all (array (), 8);

            $this -> load -> view ('home', $data);

        }

    }

?>