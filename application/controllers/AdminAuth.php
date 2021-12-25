<?php

    class AdminAuth extends CI_Controller
    {

        public function __construct()
        {

            parent::__construct ();

            $this -> session -> has_userdata('admin') == TRUE ? redirect ( base_url('adminpanel/dashboard')) : null;

            $this -> load -> model ('Admin_model', 'admin');

            $this -> load -> library ('form_validation');

        }

        public function index ()
        {

            $this -> load -> view ('adminpanel/login', array (
                'remember' => $this -> session -> userdata('remember')
            ));

        }

        public function login ()
        {

            if ( $this -> input -> method (TRUE) == 'POST') {

                $this -> form_validation -> set_rules ('admin_email', 'E-posta adresiniz', 'required|trim');
                $this -> form_validation -> set_radio ('admin_password', 'Şifreniz', 'required|trim');

                if ( $this -> form_validation -> run () == TRUE) {

                    $data = html_escape( $this -> security -> xss_clean( array (
                        'admin_email' => $this -> input -> post ('admin_email'),
                        'admin_password' => sha1($this -> input -> post ('admin_password'))
                    )));

                    if ( $this -> input -> post ('remember_admin')) {

                        $this -> session -> set_userdata('remember', array (
                            'admin_email' => $this -> input -> post ('admin_email'),
                            'admin_password' => $this -> input -> post ('admin_password')
                        ));

                    }

                    $admin = $this -> admin -> get ( $data);

                    if ( !empty($admin)) {

                        $this -> session -> set_userdata( 'admin', $admin);

                        redirect ( base_url('adminpanel/dashboard'));

                    } else {

                        $this -> session -> set_flashdata( 'alert_danger', 'E-posta adresi veya şifre hatalı!');

                        redirect ( base_url('adminpanel'));

                    }

                } else {

                    $this -> session -> set_flashdata ('alert_danger', validation_errors('<div>', '</div>'));

                    redirect (base_url('adminpanel'));

                }

            }

        }

    }

?>