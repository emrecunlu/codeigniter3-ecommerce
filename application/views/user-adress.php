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
        <div class="container my-5">
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
                    <div class="detail__title">
                        <h1>Adress Bilgilerim</h1>
                    </div>
                    <div class="user__adress">
                        <form action="" method="post">
                            <div class="input__group">
                                <label for="">Adres Başlığı</label>
                                <input type="text" name="" id="">
                            </div>
                            <div class="flex__group">
                                <div class="input__group">
                                    <label for="">İsim Soyisim</label>
                                    <input type="text" name="" id="">
                                </div>
                                <div class="input__group">
                                    <label for="">Cep Telefonu</label>
                                    <input type="text" name="" id="">
                                </div>
                            </div>
                            <div class="flex__group">
                                <div class="input__group">
                                    <label for="">Şehir</label>
                                    <select name="user_city" id="user-city">
                                        <option value="">Şehir seçiniz...</option>
                                        <?php foreach ($cities as $city) : ?>
                                        <option value="<?=$city -> sehir_key?>"><?=$city -> sehir_title;?></option>
                                        <?php endforeach; ?>
                                    </select>
                                </div>
                                <div class="input__group">
                                    <label for="">İlçe</label>
                                    <select name="user_district" id="user-district">
                                        <option value="" class="default-option">İlçe seçiniz...</option>
                                    </select>
                                </div>
                            </div>
                            <button type="submit" name="add_adress">EKLE</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <?php $this -> load -> view ('includes/scripts'); ?>
    <script>

        function removeCounties ()
        {

            $('#user-district option:not(.default-option)').remove ();

        }

        $('#user-city').change( function () {

            let cityID = $(this).val().trim();

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
</body>
</html>