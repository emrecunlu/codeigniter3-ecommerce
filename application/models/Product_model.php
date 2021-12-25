<?php 

    class Product_model extends CI_Model
    {

        private $table_name = 'products';
        
        public function __construct()
        {
            
            parent::__construct ();

        }

        public function get ($where)
        {

            $product = $this -> db
                             -> select ('products.product_id, products.product_name, products.product_price, products.product_image, products.product_url, categories.category_name, categories.category_id, products.is_live')
                             -> join ('categories', 'categories.category_id = products.category_id', 'join')  
                             -> get_where ($this -> table_name, $where);
                             
            return $product;

        }

        public function update ( $product_id, $data)
        {

            $upload = $this -> db
                            -> where ( 'product_id', $product_id)
                            -> update ( $this -> table_name, $data);

            if ( $this -> db -> affected_rows() > 0) return true;

            return false;

        }

        public function delete ( $product_id)
        {

            $delete = $this -> db
                            -> where ( 'product_id', $product_id)
                            -> delete ( $this -> table_name);

            if ( $this -> db -> affected_rows() > 0) return true;

            return false;

        }

        public function insert ( $data)
        {

            $add = $this -> db
                         -> insert ( $this -> table_name, $data);

            if ( $this -> db -> affected_rows() > 0) return true;

            return false;

        }

        public function get_all ($where = array (), $limit = null, $start = null)
        {

            $products = $this -> db
                              -> select ('products.product_id, products.product_name, products.product_price, products.product_image, products.product_url, categories.category_name, products.is_live')
                              -> join ('categories', 'categories.category_id = products.category_id', 'join')  
                              -> limit ($limit, $start)
                              -> order_by ('products.product_id', 'DESC')
                              -> get_where ($this -> table_name, $where)
                              -> result ();

            return $products;

        }

        public function get_count ($where)
        {

            $count = $this -> db
                           -> from ($this -> table_name) 
                           -> where ($where);

            return $count -> count_all_results ();

        }

        public function get_images ($where)
        {

            $images = $this -> db
                            -> get_where ('product_images', $where)
                            -> result ();
            
            return $images;

        }

        public function get_options ($where)
        {

            $options = $this -> db
                             -> get_where ('product_options', $where)
                             -> result ();

            return $options;

        }

    }

?>