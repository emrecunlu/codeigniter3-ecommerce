<?php 

    class Payment extends CI_Controller
    {

        public function __construct()
        {
            
            parent::__construct ();

            if ( !$this -> session -> has_userdata('login_user')) redirect (base_url('giris-yap'));
            
            $this -> load -> library ('cart');

            if ( !$this -> cart -> total_items() > 0) redirect (base_url('sepet'));

            $this -> load -> model ('Adress_model', 'adress');

            $this -> load -> library ('encryption');

        }

        public function index ()
        {

            $this -> load -> view ('payment', array (
                'adresses' => $this -> adress -> get_all (array ('user_id' => $this -> session -> userdata('login_user')['user_id']))
            ));

        }

    }

?>