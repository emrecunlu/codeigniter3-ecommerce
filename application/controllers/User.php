<?php 

    class User extends CI_Controller
    {

        public function __construct ()
        {
            
            parent::__construct ();

            $this -> load -> model ('User_model', 'user');

            $this -> load -> model ('Adress_model', 'adress');

            $this -> load -> helper ('date');

            $this -> load -> library ('form_validation');

            $this -> load -> library ('encryption');
            

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

                        $this -> session -> set_flashdata    ('login', 'Giriş başarılı, yüzlerce indirimli ürünler sizi bekliyor.');

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

        public function logout ()
        {

            if ( $this -> session -> has_userdata ('login_user')) {

                $this -> session -> set_flashdata ('logout', 'Güvenli bir şekilde çıkış yaptınız.');

                $this -> session -> unset_userdata ('login_user');

                redirect ( base_url ('giris-yap'));

                exit ;

            } else {

                print_r ( $this -> session -> get_userdata ());

            }

        }

        public function change_name ()
        {

            if ( $this -> input -> method ('REQUEST_METHOD') == 'POST')
            {

                $this -> form_validation -> set_rules ('user_name', 'İsminiz', 'required|trim|min_length[5]|max_length[50]');

                if ( $this -> form_validation -> run () == TRUE) {

                    $user_name = html_escape( $this -> input -> post ('user_name', true));

                    if ( $this -> user -> update ( $this -> session -> userdata('login_user')['user_id'], array (
                        'user_name' => $user_name
                    ))) {

                        $this -> session -> set_flashdata ('success', '<li>İsminiz başarıyla değişti.</li>');

                        redirect (base_url('hesap-ayarlari'));

                    } else {

                        $this -> session -> set_flashdata ('error', '<li>Lütfen yeni bir isim giriniz.</li>');

                        redirect (base_url('hesap-ayarlari'));
                        
                    }


                } else {

                    $this -> session -> set_flashdata ('error', validation_errors('<li>', '</li>'));


                    redirect (base_url('hesap-ayarlari'));

                }

            }

        }

        public function change_password ()
        {

            if ( $this -> input -> method ('REQUEST_METHOD') == 'POST')
            {

                $this -> form_validation -> set_rules ('user_password', 'Şifreniz', 'required|trim|min_length[3]|max_length[50]');

                if ( $this -> form_validation -> run () == TRUE) {

                    $user_data = html_escape( xss_clean(array (
                        'user_oldpassword' => sha1($this -> input -> post ('user_oldpassword')),
                        'user_newpassword' => $this -> input -> post ('user_password'),
                    )));

                    $user = $this -> user -> get (['user_id' => $this -> session -> userdata ('login_user')['user_id']]) -> row ();

                    if ( $user -> user_password == $user_data ['user_oldpassword']) {

                        if ( $this -> user -> update ($user -> user_id, array (
                            'user_password' => sha1($user_data ['user_newpassword'])
                        ))) {

                            $this -> session -> set_flashdata ('success', '<li>Şifreniz değişti, Lütfen yeniden giriş yapınız.</li>');

                            $this -> logout();

                        } else {

                             $this -> session -> set_flashdata ('error', '<li>Lütfen yeni bir şifre</li>');

                            redirect (base_url('hesap-ayarlari'));

                        }

                    } else {

                        $this -> session -> set_flashdata ('error', '<li>Şifre eski şifreniz ile eşleşmiyor.</li>');

                        redirect (base_url('hesap-ayarlari'));

                    }

                } else {

                    $this -> session -> set_flashdata ('error', validation_errors('<li>', '</li>'));


                    redirect (base_url('hesap-ayarlari'));

                }

            }
            
        }

        public function delete_adress ()
        {

            if ( $this -> input -> method ('REQUEST_METHOD') == 'POST') {

                $adress_id = html_escape( $this -> security -> xss_clean ( $this -> encryption -> decrypt ($this -> input -> post ('adress_id'))));

                if ( !empty ($adress_id)) {

                    if ( $this -> adress -> delete (array (
                        'user_id' => $this -> session -> userdata ('login_user')['user_id'],
                        'adress_id' => $adress_id
                    ))) {

                        $this -> session -> set_flashdata ('success', '<li>Adresiniz başarıyla silindi!</li>');

                        redirect (base_url('adreslerim'));

                    }

                }

            }

        }

        public function add_adress ()
        {

            if ( $this -> input -> method ('REQUEST_METHOD') == 'POST') {

                $this -> form_validation -> set_rules ('adress_title', 'Adres başlığınız', 'required|trim|min_length[2]|max_length[30]');

                $this -> form_validation -> set_rules ('user_name', 'İsminiz', 'required|trim|min_length[3]|max_length[30]');

                $this -> form_validation -> set_rules ('user_tel', 'Telefon numaranız', 'required|trim|regex_match[/[0-9]{10}/]');

                $this -> form_validation -> set_rules ('user_city', 'Şehir', 'required|trim');

                $this -> form_validation -> set_rules ('user_district', 'İlçe', 'required|trim');

                $this -> form_validation -> set_rules ('user_adress', 'Adresiniz', 'required|trim|min_length[10]|max_length[255]');

                $this -> form_validation -> set_rules ('user_tc', 'T.C Kimlik No', 'required|trim|regex_match[/[0-9]{11}/]');


                if ( $this -> form_validation -> run () == TRUE) {

                    $data = html_escape( $this -> security -> xss_clean (array (
                        'user_id' => $this -> session -> userdata ('login_user')['user_id'],
                        'adress_title' => $this -> input -> post ('adress_title'),
                        'user_name' => $this -> input -> post ('user_name'),
                        'user_tel' => $this -> input -> post ('user_tel'),
                        'user_city	' => $this -> input -> post ('user_city'),
                        'user_district' => $this -> input -> post ('user_district'),
                        'user_adress' => $this -> input -> post ('user_adress'),
                        'user_tc' => $this -> input -> post ('user_tc'),
                    )));

                    if ( $this -> adress -> add ($data)) {

                        $this -> session -> set_flashdata ('success', '<li>Adres başarıyla eklendi!</li>');

                        redirect(base_url('adreslerim'));

                    }

                } else {

                    $this -> session -> set_flashdata ('error', validation_errors('<li>', '</li>'));

                    redirect(base_url('adreslerim'));

                }

            }

         }

    }

?>