<?php 

    class UserSettings extends CI_Controller
    {
        
        private $user_id;

        public function __construct()
        {
        
            parent::__construct ();
            
            if ( !$this -> session -> has_userdata ('login_user')) 
                redirect ( base_url('giris-yap'));
            
             $this -> load -> model ('User_model', 'user');

             $this -> load -> model ('Place_model', 'place');

             $this -> load -> model ('Adress_model', 'adress');

             $this -> load -> library ('encryption');

             $this -> user_id = $this -> session -> userdata ('login_user')['user_id'];

        }

        public function index ()
        {
        

            $user = $this -> user -> get (array ('user_id' => $this -> user_id)) -> row ();

            $this -> load -> view ('user-detail', array (
                'user' => $user
            ));

        }

        public function list_orders ()
        {

            $this -> load -> model ('Orders_model', 'orders');

            $data ['orders'] = $this -> orders -> get_all (array ('orders.user_id' => $this -> session -> userdata('login_user')['user_id'], 'is_completed' => 1));

            $this -> load -> view ('orders', $data);

        }

        public function adress ()
        {

            $cities = $this -> place -> get_cities ();
            $adresses = $this -> adress -> get_all (array ('user_id' => $this -> user_id));

            $this -> load -> view ('user-adress', array (
                'cities' => $cities,
                'adresses' => $adresses
            ));

        }

    }

?>