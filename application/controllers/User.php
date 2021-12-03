<?php 

    class User extends CI_Controller
    {

        public function __construct ()
        {
            
            parent::__construct ();

            $this -> load -> model ('User_model', 'user');

            $this -> load -> helper ('date');

            $this -> load -> library ('form_validation');

        }

        public function register ()
        {

            if ( $this -> input -> method ('REQUEST_METHOD') === 'POST') {

                $this -> form_validation -> set_rules ('user_name', 'İsminiz', 'required|trim|min_length[3]|max_length[50]');

                $this -> form_validation -> set_rules ('user_email', 'E-posta adresiniz', 'required|trim|valid_email|is_unique[users.user_email]');

                $this -> form_validation -> set_rules ('user_password', 'Şifreniz', 'required|trim|min_length[3]|max_length[25]');

                $this -> form_validation -> set_rules ('user_repassword', 'Şifreniz', 'matches[user_password]', array (
                    'matches' => 'Şifreler eşleşmiyor.'
                ));

                if ( $this -> form_validation -> run () == TRUE) {

                    $user_data = $this -> security -> xss_clean ( html_escape(array (
                        'user_name' => $this -> input -> post ('user_name'),
                        'user_email' => $this -> input -> post ('user_email'),
                        'user_password' => sha1( $this -> input -> post ('user_password')),
                    )));

                    if ( $this -> user -> add ( $user_data)) {

                        $this -> session -> set_flashdata ('success', '<li>Kayıt başarılı, Lütfen giriş yapınız.</li>');

                        redirect( base_url('giris-yap'));

                    } else {

                        $this -> session -> set_flashdata ('error', '<li>Kayıt esnasında bir hata oluştu.</li>');

                        redirect( base_url('kayit-ol'));

                    }

                } else {

                    $this -> session -> set_flashdata ('error', validation_errors('<li>', '</li>'));

                    redirect (base_url('kayit-ol'));

                }

            }

        }
        
        public function login ()
        {

            if ( $this -> input -> method ('REQUEST_METHOD') === 'POST') {

                $this -> form_validation -> set_rules ('user_email', 'E-posta adresiniz', 'required|trim|valid_email');

                $this -> form_validation -> set_rules ('user_password', 'required|trim');

                if ( $this -> form_validation -> run () == TRUE) {

                    $user_data = $this -> security -> xss_clean ( html_escape(array (
                        'user_email' => $this -> input -> post ('user_email'),
                        'user_password' => sha1($this -> input -> post ('user_password'))
                    )));

                    $user = $this -> user -> get ( $user_data);

                    if ( $user -> num_rows () > 0 ) {
                        
                        $user = $user -> row ();

                        $this -> session -> set_userdata ('login_user', array (
                            'user_id' => $user -> user_id,
                            'login_time' => date('Y-m-d H:i:s')
                        ));

                        redirect ( base_url());

                    } else {

                        $this -> session -> set_flashdata ('error', '<li>E-posta adresi veya şifreniz hatalı.</li>');
                    
                        redirect( base_url('giris-yap'));

                    }

                } else {

                    $this -> session -> set_flashdata ('error', validation_errors('<li>', '</li>'));
                    
                    redirect( base_url('giris-yap'));

                }

            }

        }

    }

?>