<?php

    class Adminpanel extends CI_Controller
    {

        private $admin;

        public function __construct()
        {

            parent::__construct ();

            if ( $this -> session -> has_userdata('admin')) $this -> admin = $this -> session -> userdata ('admin');
            else redirect ( base_url('adminpanel'));

            $this -> load -> helper ('text');

            $this -> load -> library ('encryption');

        }

        public function dashboard ()
        {

            $this -> load -> view ('adminpanel/dashboard');

        }

        public function showProducts ()
        {

            $this -> load -> model ('Product_model', 'product');

            $this -> load -> model ('Categories_model', 'categories');

            $data ['products'] = $this -> product -> get_all ();
            $data ['categories'] = $this -> categories -> get_all ();

            $this -> load -> view ('adminpanel/all-products', $data);

        }

        public function addProduct ()
        {

            $this -> load -> model ('Categories_model', 'category');

            $data['categories'] = $this -> category -> get_all ();

            $this -> load -> view ('adminpanel/add-product', $data);

        }

    }

?>