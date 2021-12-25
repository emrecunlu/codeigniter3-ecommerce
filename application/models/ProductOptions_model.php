<?php

class ProductOptions_model extends CI_Model
{

    private $table_name = 'product_options';

    public function __construct()
    {

        parent::__construct ();

    }

    public function insert ( $data)
    {

        $added = $this -> db
                       -> insert ( $this -> table_name, $data);

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

    public function get ($product_id)
    {

        $product = $this -> db 
                         -> get_where ($this -> table_name, array ( 'product_id' => $product_id))
                         -> result ();  
        return $product;

    }

}

?>