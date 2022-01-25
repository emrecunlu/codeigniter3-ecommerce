<?php

    class Visitors
    {

        protected $CI;

        public function __construct()
        {
            $this -> CI =& get_instance();
        }

        public function save_visitor()
        {

            $this -> CI -> load -> library('user_agent');

            $uri = $this -> CI -> uri -> uri_string();

            if (!preg_match('/adminpanel.*||admin.*||api.*/', $uri)) {

                $data = array (
                    'ip_address' => $this -> CI -> input -> ip_address(),
                    'referrer' => $this -> CI -> agent -> is_referral() == TRUE ? $this -> CI -> agent -> referrer : NULL,
                    'platform' => $this -> CI -> agent -> platform,
                    'browser' => $this -> CI -> agent -> browser,
                    'page' => $this -> CI -> uri -> uri_string() == '' ? 'Anasayfa' : $this -> CI -> uri -> uri_string()
                );

                $this -> CI -> load -> model('Visitor_model', 'visitor');

                $this -> CI -> visitor -> insert($data);

            }
        }

    }

?>