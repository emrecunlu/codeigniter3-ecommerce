<?php 

    class Product_model extends CI_Model
    {

        private $table_name = 'products';
        
        public function __construct()
        {
            
            parent::__construct ();

        }

        public function get_all ($where = array (), $limit = null)
        {

            $products = $this -> db
                              -> select ('products.product_id, products.product_name, products.product_price, products.product_image, products.product_url, categories.category_name')
                              -> join ('categories', 'categories.category_id = products.category_id', 'join')  
                              -> limit ($limit)
                              -> order_by ('products.product_id', 'DESC')
                              -> get_where ($this -> table_name, $where)
                              -> result ();

            return $products;

        }

    }

?>