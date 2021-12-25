<?php

    class Admin extends CI_Controller
    {

        public function __construct()
        {

            parent::__construct ();

            $this -> session -> has_userdata('admin') == TRUE ? null : exit ;

            $this -> load -> library ('form_validation');

            $this -> load -> model ('Categories_model', 'category');

            $this -> load -> library ('encryption');

        }

        public function get_product ()
        {

            if ( $this -> input -> is_ajax_request()) {

                $json = array ();

                $this -> form_validation -> set_rules ('product_id', 'Ürünü id', 'required|trim');
            
                if ( $this -> form_validation -> run () ) {

                    $this -> load -> model ('Product_model', 'product');

                    $product = $this -> product -> get ( array ('product_id' => $this -> encryption -> decrypt ( $this -> input -> post ('product_id', TRUE))));

                    if ( $product -> num_rows () > 0) {

                        $json = array (
                            'status' => 'success',
                            'product' => $product -> row ()
                        );

                    } else {

                        $json = array (
                            'status' => 'error',
                            'message' => 'Lütfen geçerli bir id giriniz.'
                        );

                    }

                } else {

                    $json = array (
                        'status' => 'error',
                        'message' => $this -> form_validation -> form_error ('product_id')
                    );

                }

                echo json_encode(  $json);

                exit ;
                
            }

        }

        public function delete ()
        {

            if ( $this -> input -> is_ajax_request()) {

                $json = array ();

                $this -> form_validation -> set_rules ('product_id', 'Ürün Id', 'required|trim');

                if ( $this -> form_validation -> run () == TRUE ) {

                    $this -> load -> model ('Product_model', 'product');

                    $product_id = $this -> encryption -> decrypt ( $this -> input -> post ('product_id', TRUE));

                    $product = $this -> product -> get ( array ('product_id' => $product_id)) -> row ();

                    if ( $this -> product -> get ( array ( 'product_id' => $product_id)) -> num_rows () > 0) {

                        $this -> load -> model (array ('ProductOptions_model', 'ProductImages_model'));

                        $this -> load -> library ('file');

                        $options = $this -> ProductOptions_model -> get ($product_id);

                        $images = $this -> ProductImages_model -> get ($product_id);

                        if ( !empty ( $images)) {
                            
                            foreach ( $images as $image) {

                                $file = array (
                                    'path' => './public/uploads/',
                                    'file_name' => $image -> image_path
                                );

                                $this -> file -> initialize ( $file);

                                $this -> file -> delete ();

                            }

                            $this -> ProductImages_model -> delete ( $product_id);

                        }

                        if ( !empty( $options)) {

                            $this -> ProductOptions_model -> delete ( $product_id);

                        }

                        if ( $this -> product -> delete ( $product_id)) {

                            $file = array (
                                'path' => './public/uploads/',
                                'file_name' => $product -> product_image
                            );

                            $this -> file -> initialize ( $file);

                            $this -> file -> delete ();

                            $json = array (
                                'status' => 'success',
                                'message' => 'Ürün başarıyla silindi!'
                            );

                        }
                        

                    } else {

                        $json = array (
                            'status' => 'error',
                            'message' => 'Lütfen geçerli bir ürün id gönderiniz.'
                        );

                    }

                } else {

                    $json = array (
                        'status' => 'error',
                        'message' => 'Lütfen ürün id giriniz.'
                    );

                }

                echo json_encode( $json);

                exit ;

            }

        }

        public function update_product ()
        {

            if ( $this -> input -> method(TRUE) == 'POST') {

                $this -> form_validation -> set_rules ('product_name', 'Ürün başlık', 'required|trim|min_length[5]|max_length[255]');
                $this -> form_validation -> set_rules ('product_price', 'Ürün fiyat', 'required|trim|decimal');
                $this -> form_validation -> set_rules ('product_category', 'Ürün kategori', 'required|trim');
                $this -> form_validation -> set_rules ('product_id', 'Ürün Id', 'required|trim');

                if ( $this -> form_validation -> run () == TRUE) {
                    
                    $this -> load -> model ('Product_model', 'product');

                    $product = $this -> product -> get ( array ('product_id' => $this -> input -> post ('product_id', TRUE)));

                    if ( $product -> num_rows () > 0) {

                        $product = $product -> row ();

                        $data = html_escape( $this -> security -> xss_clean ( array (
                            'product_name' => $this -> input -> post ('product_name'),
                            'product_price' => $this -> input -> post ('product_price'),
                            'category_id' => $this -> input -> post ('product_category'),
                            'is_live' => $this -> input -> post ('product_status') == TRUE ? 1 : 0,
                            'product_url' => slugify( $this -> input -> post ('product_name')),
                            'product_image' => $product -> product_image
                        )));
                        
                        if ( isset ( $_FILES['product_thumbnail']) && $_FILES['product_thumbnail']['error'] == 0) {
                            
                            $this -> load -> library (array ('upload', 'file'));

                            $file = array (
                                'path' => './public/uploads/',
                                'file_name' => $data ['product_image']
                            );

                            $upload_settings = array (
                                'upload_path' => './public/uploads/',
                                'allowed_types' => 'png|jpg|jpeg',
                                'max_size' => 10000,
                                'file_ext_tolower' => true,
                                'encrypt_name' => true,
                                'remove_spaces' => true
                            );

                            $this -> upload -> initialize ( $upload_settings);

                            $this -> file -> initialize ( $file);

                            if ( $this -> upload -> do_upload ( 'product_thumbnail')) {

                                $this -> file -> delete ();

                                $data['product_image'] = $this -> upload -> data()['file_name'];

                            } else {

                                $upload_error = true;

                            }

                        }

                        if ( !isset ( $upload_error)) {

                            if ( $this -> product -> update ( $this -> input -> post ('product_id', TRUE), $data)) {

                                $this -> session -> set_flashdata ('toastr_success', 'Ürün başarıyla güncellendi!');
    
                                redirect( base_url('adminpanel/showProducts'));
    
                            }    

                        } else {

                            $this -> session -> set_flashdata ('toastr_error', $this -> upload -> display_errors());

                            redirect( base_url('adminpanel/showProducts'));

                        }
                    

                    } else {

                        $this -> session -> set_flashdata ('toastr_error', 'Lütfen geçerli bir ürün id giriniz.');

                        redirect( base_url('adminpanel/showProducts'));

                    }
                    

                } else {

                    $this -> session -> set_flashdata ('alert_danger', validation_errors('<li>', '</li>'));

                    redirect( base_url('adminpanel/showProducts'));

                }

            }

        }

        public function add_product ()
        {

            if ( $this -> input -> method(TRUE) == 'POST') {

                $categories = $this -> category -> get_all ();

                $this -> form_validation -> set_error_delimiters ('<small class="form-text">', '</small>');

                $this -> form_validation -> set_rules ('product_name', 'Ürün başlık', 'required|trim|min_length[5]|max_length[255]');
                $this -> form_validation -> set_rules ('product_price', 'Ürün fiyat', 'required|trim|decimal');
                $this -> form_validation -> set_rules ('product_category', 'Ürün kategori', 'required|trim');

                if ( $this -> form_validation -> run () == TRUE && isset ( $_FILES['product_thumbnail']) && $_FILES['product_thumbnail']['error'] == 0) {

                    $this -> load -> model ('Product_model', 'product');

                    $upload_settings = array (
                        'upload_path' => './public/uploads/',
                        'allowed_types' => 'png|jpg|jpeg',
                        'max_size' => 10000,
                        'file_ext_tolower' => true,
                        'encrypt_name' => true,
                        'remove_spaces' => true
                    );

                    $this -> load -> library ('upload', $upload_settings);

                    if ( $this -> upload -> do_upload( 'product_thumbnail')) {

                        $upload_data = $this -> upload -> data();

                        $product = html_escape( $this -> security -> xss_clean( array (
                            'product_name' => $this -> input -> post ('product_name'),
                            'product_price' => $this -> input -> post ('product_price'),
                            'category_id' => $this -> input -> post ('product_category'),
                            'product_image' => $upload_data['file_name'],
                            'product_url' => slugify( $this -> input -> post ('product_name')),
                            'is_live' => $this -> input -> post ('product_status') == TRUE ? 1 : 0
                        )));

                        if ( $this -> product -> insert ( $product)) {

                            $product_id = $this -> db -> insert_id();

                            if ( isset ( $_FILES['product_images'])) {

                                $this -> load -> model ('ProductImages_model', 'images');

                                foreach ( $_FILES['product_images']['name'] as $key => $file) {

                                    $_FILES['image']['name'] = $_FILES['product_images']['name'][$key];
                                    $_FILES['image']['type'] = $_FILES['product_images']['type'][$key];
                                    $_FILES['image']['tmp_name'] = $_FILES['product_images']['tmp_name'][$key];
                                    $_FILES['image']['error'] = $_FILES['product_images']['error'][$key];
                                    $_FILES['image']['size'] = $_FILES['product_images']['size'][$key];

                                    if ( $this -> upload -> do_upload ( 'image')) {

                                        $uploaded = $this -> upload -> data();

                                        $category_data = array (
                                            'product_id' => $product_id,
                                            'image_path' => $uploaded['file_name']
                                        );

                                        $this -> images -> insert ( $category_data);

                                    }

                                }

                            }

                            if ( $this -> input -> post ('product_options')) {

                                $this -> load -> model ('ProductOptions_model', 'options');

                                foreach ( $this -> input -> post ('product_options') as $option) {

                                    $option_data = array (
                                        'product_id' => $product_id,
                                        'option_value' => $option
                                    );

                                    $this -> options -> insert ( $option_data);

                                }

                            }

                            $this -> session -> set_flashdata ('alert_success', 'Ürün başarıyla eklendi!');

                            redirect( base_url('adminpanel/addProduct'));

                        }

                    }

                } else {

                    if ( !isset ( $_FILES['product_thumbnail']) || $_FILES['product_thumbnail']['error'] == 4) $this -> session -> set_flashdata ('thumbnail_error', '<small class="form-text">Lütfen ürün thumbnail seçiniz.</small>');

                    $this -> session -> set_flashdata ('name_error', form_error('product_name'));
                    $this -> session -> set_flashdata ('price_error', form_error('product_price'));
                    $this -> session -> set_flashdata ('category_error', form_error('product_category'));

                    redirect ( base_url('adminpanel/addProduct'));

                }

            }

        }

    }

?>