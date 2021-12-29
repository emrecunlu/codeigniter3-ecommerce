<?php 

    class Product extends CI_Controller
    {

        public function __construct()
        {
            
            parent::__construct ();

            $this -> load -> model ('Product_model', 'product');

            $this->load->library('encryption');

        }

        public function index ($url)
        {

            $url = $this -> security -> xss_clean( html_escape($url));

            $product = $this -> product -> get (array (
                'product_url' => $url
            ));

            if ( $product -> num_rows () > 0) {

                $product = $product -> row ();
                
                
                $this -> load -> view ('product', array (
                    'product' => $product,
                    'images' => $this -> product -> get_images (array (
                        'product_id' => $product -> product_id
                    )),
                    'options' => $this -> product -> get_options ( array (
                        'product_id' => $product -> product_id
                    )),
                    'best_sellers' => $this -> product -> get_all (array (), 8)
                ));

            } else {

                show_404();

            }

        }

    }

?>