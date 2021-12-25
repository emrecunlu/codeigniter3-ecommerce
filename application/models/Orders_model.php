<?php 

    class Orders_model extends CI_Model
    {

        private $table_name = 'orders';

        public function __construct()
        {
            
            parent::__construct ();

        }

        public function add ( $data)
        {

            $add = $this -> db
                         -> insert_batch ( $this -> table_name, $data);


            if ( $this -> db -> affected_rows () > 0) return true;

            return false;

        }

        public function delete ($where)
        {

            $delete = $this -> db
                            -> where ( $where)
                            -> delete ( $this -> table_name);

            if ( $this -> db -> affected_rows() > 0) return true;

            return false;

        }

        public function get_all ($where = array ())
        {

            $orders = $this -> db
                            -> select ('products.product_name, products.product_image, orders.total_price, orders.quantity, orders.purchase_date, product_options.option_value')
                            -> join ('products', 'products.product_id = orders.product_id', 'inner')
                            -> join ('product_options', 'product_options.option_id = orders.option_id', 'left')
                            -> order_by ('orders.purchase_date', 'desc')
                            -> get_where ($this -> table_name, $where)
                            -> result (); 

            return $orders;

        }

        public function update ( $where, $data)
        {

            $update = $this -> db
                            -> where ( $where)
                            -> update ( $this -> table_name, $data);

            if ( $this -> db -> affected_rows () > 0) return true;

            return false;

        }

    }

?>