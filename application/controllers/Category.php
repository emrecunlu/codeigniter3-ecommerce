<?php 

    class Category extends CI_Controller
    {

        public function __construct()
        {
            
            parent::__construct ();

            $this -> load -> model ('Categories_model', 'category');

            $this -> load -> model ('Product_model', 'product');

            $this -> load -> library ('pagination');

            $this -> load -> config ('pagination');

            $this -> load -> helper ('text');

        }

        public function index ($category_url)
        {

            $category_url = html_escape( xss_clean($category_url));

            $category = $this -> category -> get (array ('category_url' => $category_url));

            if ($category -> num_rows () > 0) {
                
                $category = $category -> row ();
                $where_query = array (
                    'products.category_id' => $category -> category_id,
                    'is_live >' => 0
                );

                $config['base_url'] = base_url('kategori/' . $category -> category_url);
                $config['total_rows'] = $this -> product -> get_count($where_query);
                $config['per_page'] = 16;
                $config['uri_segment'] = 3;

                $this -> pagination -> initialize ($config);

                $data['links'] = $this -> pagination -> create_links ();

                $page = $this -> uri -> segment (3) ? $this -> uri -> segment (3) : 0;

                if ( $page > 0) $offset =  ( $page * $config ['per_page'] - $config ['per_page']);
                else $offset = $page;
                
                $data['products'] = $this -> product -> get_all ($where_query, $config ['per_page'], $offset);

                $data ['category_name'] = $category -> category_name;

                $this -> load -> view ('category-product', $data);

            } else {

                show_404();

            }

        }

    }

?>