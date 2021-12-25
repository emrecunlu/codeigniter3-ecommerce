<?php

    class Admin extends CI_Controller
    {

        public function __construct()
        {

            parent::__construct ();

            $this -> session -> has_userdata('admin') == TRUE ? null : exit ;

            $this -> load -> library ('form_validation');

            $this -> load -> model ('Categories_model', 'category');

        }

        public function update_product ()
        {

            echo 'hi!';

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