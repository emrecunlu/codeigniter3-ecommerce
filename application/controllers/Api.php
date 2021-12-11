<?php 

    class Api extends CI_Controller
    {

        public function __construct()
        {
            
            parent::__construct ();

            $this -> load -> model ('Place_model', 'place');

            $this -> load -> model ('Product_model', 'product');

            $this -> load -> library ('form_validation');

            $this -> load -> library ('encryption');

            $this->cart->product_name_rules = '[:print:]';

        }

        public function update_basket ()
        {

            if ( $this -> input -> method ('REQUEST_METOHD') == 'POST') {
                
                $rowid = html_escape( $this -> input -> post ('rowid'));
                $item_qty = html_escape( $this -> input -> post ('itemQty'));
                
                $update_item = array (
                    'rowid' => $rowid,
                    'qty' => $item_qty
                );

                if ( $this -> cart -> get_item ($rowid)) {

                    if ( $item_qty <= 0) {

                        if ( $this -> cart -> remove ($rowid)) {
                            
                            echo json_encode( array (
                                'status' => 'refresh',
                                'message' => 'Ürün başarıyla silindi!'
                            ));
        
                            exit ;

                        }

                    } else {

                        if ( $this -> cart -> update ($update_item)) {

                            echo json_encode( array (
                                'status' => 'OK',
                                'message' => 'Ürününüz güncellendi.',
                                'prop' => array (
                                    'ara_toplam' => number_format($this -> cart -> total () - $this -> cart -> total () * 18 / 100, 2, ',', '.'),
                                    'kdv' => number_format($this -> cart -> total () * 18 / 100, 2, ',', '.'),
                                    'toplam' => number_format($this -> cart -> total (), 2, ',', '.'),
                                    'urun_toplam' => number_format($this -> cart -> get_item ($rowid)['subtotal'], 2, ',', '.'),
                                    'basket_total' => $this -> cart -> total_items ()
                                )
                            ));
        
                            exit ;

                        }

                    }

                } else {

                    echo json_encode( array (
                        'status' => 'error',
                        'message' => 'Geçersize ürün.'
                    ));

                    exit ;
 
                }

            }

        }

        public function add_basket ()
        {

            if ( $this -> input -> method ('REQUEST_METHOD') == 'POST') {

                $data = $this -> security -> xss_clean ( html_escape( array (
                    'id' => $this -> encryption -> decrypt ( $this -> input -> post ('product_id')),
                    'option' => $this -> input -> post ( 'product_option')
                )));

                $product = $this -> product -> get (array (
                    'product_id' => $data ['id'],
                    'is_live' => 1
                ));

                if ( $product -> num_rows () > 0) {

                    $product = $product -> row ();

                    $option = $this -> product -> get_options (array (
                        'option_id' => $data ['option']
                    ));

                    $option = !empty($option) ? $option[0] -> option_value : '';

                    $cart_item = array (
                        'id' => 'sku_' . $product -> product_id . '_' . $data ['option'],
                        'qty' => 1,
                        'price' => $product -> product_price,
                        'name' => $product -> product_name,
                        'image' => $product -> product_image,
                        'options' => array (
                            'id' => $data ['option'],
                            'value' => $option
                        ),
                        'url' => $product -> product_url
                    );

                    if ( $this -> cart -> insert ($cart_item)) {

                        echo json_encode( array (
                            'status' => 'OK',
                            'message' => 'Ürün sepetinize eklendi.',
                            'basket_qty' => $this -> cart -> total_items ()
                        ));
                        
                        exit ; 

                    }

                } else {

                    echo json_encode( array (
                        'status' => 'error',
                        'message' => 'Sepete eklemek istediğiniz ürün bulunamadı.'
                    ));

                    exit ;

                }

            }

        }

        public function get_counties ($city_id)
        {

            if ( isset ($city_id)) {

                $city_id = html_escape( $this -> security -> xss_clean ($city_id));

                $counties = $this -> place -> get_counties ($city_id);

                echo json_encode( array (
                    'status' => 'OK',
                    'counties' => $counties
                ));

                exit ;

            } else {

                echo json_encode(array (
                    'status' => 'error',
                    'message' => 'not found city id'
                ));

            }

        }

    }

?>