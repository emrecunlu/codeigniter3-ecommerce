<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <?php $this -> load -> view ('includes/links'); ?>
</head>
<body>
<?php $this -> load -> view ('includes/header') ?>
<?php $this -> load -> view ('includes/navbar') ?>
    <div class="body pt-1 pt-xl-0">
        <div class="container my-xl-5 my-0">
            <div class="user__detail">
                <div class="detail__tabs">
                    <ul>
                        <li>
                            <a href="<?=base_url('hesap-ayarlari')?>">Üyelik Bilgilerim</a>
                        </li>
                        <li class="active">
                            <a href="<?=base_url('adreslerim');?>">Adres Bilgilerim</a>
                        </li>
                        <li>
                            <a href="<?=base_url('siparislerim');?>">Siparişlerim</a>
                        </li>
                        <li>
                            <a href="<?=base_url('user/logout');?>">Çıkış Yap</a>
                        </li>
                    </ul>
                </div>
                <div class="detail__contents">
                    <?php $this -> load -> view ('includes/msg_error'); ?>
                    <div class="detail__title">
                        <h1>Adress Bilgilerim</h1>
                    </div>
                    <?php $this -> load -> view ('includes/adresses'); ?>
                    <p>Adreslerinizi görüntüleyebilir, değişiklik yapabilir ve yeni adres ekleyebilirsiniz.</p>
                    <div class="add-new__adress">
                        <button type="button" class="pri__btn">Yeni Adres Ekle.</button>
                    </div>
                    <?php $this -> load -> view ('includes/adress_form'); ?>
                </div>
            </div>
        </div>
    </div>
    <?php $this -> load -> view ('includes/scripts'); ?>
    <script>

        $('#user-tc').inputmask({
            'mask': '99999999999',
            'removeMaskOnSubmit': true
        });
        $('#user-tel').inputmask({
            'mask': '(999) 999-9999',
            'removeMaskOnSubmit': true
        });

    </script>
    <script>

        function removeCounties ()
        {

            $('#user-district option:not(.default-option)').remove ();

        }

        $('#user-city').change( function () {

            let cityID = $(this).find('option').filter(':selected').attr('city-key');

            if (cityID !== '') {

                $.ajax ({
                    type: 'GET',
                    url: 'api/get_counties/' + cityID,
                    dataType: 'JSON',

                    success: function ( response) {

                        if ( response.status === 'OK') {

                            removeCounties();

                            response.counties.forEach (district => {

                                $('#user-district').append(`
                                    <option value="${district.ilce_id}">${district.ilce_title}</option>
                                `);

                            });

                        }

                    }
                })

            } else {

                removeCounties();

            }

        });

    </script>
    <script>

        $('.pri__btn').click ( function () {

            $('.user__adress').toggleClass('active');

        });

    </script>
</body>
</html>