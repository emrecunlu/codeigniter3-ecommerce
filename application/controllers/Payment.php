<?php 

    class Payment extends CI_Controller
    {

        private $user_id;

        public function __construct()
        {
            
            parent::__construct ();

            if ( !$this -> session -> has_userdata('login_user')) redirect (base_url('giris-yap'));

            $this -> user_id = $this -> session -> userdata('login_user')['user_id'];
            
            $this -> load -> library ('cart');

            if ( !$this -> cart -> total_items() > 0) redirect (base_url('sepet'));

            $this -> load -> model ('Adress_model', 'adress');

            $this -> load -> model ('User_model', 'user');

            $this -> load -> library ('encryption');

        }

        public function index ()
        {

            $this -> load -> view ('payment', array (
                'adresses' => $this -> adress -> get_all (array ('user_id' => $this -> session -> userdata('login_user')['user_id']))
            ));

        }
        
        public function show_form ()
        {

            if ( $this -> input -> method(TRUE) == 'POST' && $this -> input -> post ('adress_id')) {

                $user_address = $this -> adress -> get ( array ('user_id' => $this -> user_id));

                $user = $this -> user -> get ( array ('user_id' => $this -> user_id)) -> row ();

                $full_name = explode ( ' ', $user -> user_name);

                if ( !isset ($full_name[1])) $full_name[1] = '';
 
                $form = array (
                    'order_id' => random_string ('numeric'),
                    'total_price' => $this -> cart -> total (),
                    'paid_price' => $this -> cart -> total (),
                    'basket_id' => random_string ('numeric'),
                );

                $buyer = array (
                    'id' => $user -> user_id,
                    'name' => $full_name[0],
                    'surname' => $full_name[1],
                    'email' => $user -> user_email,
                    'tc_number' => $user_address -> user_tc,
                    'address' => $user_address -> user_adress,
                    'ip_address' => $this -> input -> ip_address (),
                    'gsm_number' => $user_address -> user_tel,
                    'city' => $user_address -> sehir_title
                );

                $this -> load -> library ('Iyzico_Payment', NULL, 'iyzico');

                $this -> iyzico
                      -> set_form ( $form)
                      -> set_buyer ( $buyer)
                      -> set_cart ( $this -> cart -> contents ())
                      -> send ();
                
                $this -> load -> model ('Orders_model', 'order');

                foreach ( $this -> cart -> contents () as $key => $item) {

                    $cart[$key] = array (
                        'user_id' => $user -> user_id,
                        'product_id' => $item['product_id'],
                        'adress_id' => $user_address -> adress_id,
                        'option_id' => $item['options']['id'],
                        'quantity' => $item['qty'],
                        'total_price' => $item['subtotal'],
                        'order_no' => $form['order_id'],
                        'user_ip' => $this -> input -> ip_address()
                    );

                }

                $this -> order -> add ( $cart);

                $this -> load -> view ('payment-screen');
                
            }

        }

        public function new_payment ($order_id = null)
        {
            setcookie('cross-site-cookie', 'bar', ['samesite' => 'None', 'secure' => true]);

            // Iyzico samesite problem fixed.

            if ( $this -> input -> method (true) == 'POST')
            {

                $this -> load -> library ('Iyzico_Payment', NULL, 'iyzico');

                $data = $this -> iyzico
                                -> status ( $order_id, $this -> input -> post ('token'));

                $this -> load -> model ('Orders_model', 'order');

                if ( $data['status'] === 'success') {

                    $this -> order -> update ( array ('order_no' => $order_id), array ('is_completed' => 1));

                    $this -> session -> set_flashdata ('payment_success', true);

                    $this -> cart -> destroy();

                    redirect ( base_url());

                } elseif ($data['status'] === 'failure') {

                    $this -> order -> delete ( array ('order_no' => $order_id));

                    $this -> session -> set_flashdata ('paymet_error', $data['message']);

                    redirect ( base_url());

                }
                
            }

        }

    }

?>