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
<?php $this -> load -> view ('includes/header'); ?>
<?php $this -> load -> view ('includes/navbar'); ?>
    <div class="body pt-1 pt-xl-0">
        <div class="container my-5">
            <div class="user__detail">
                <div class="detail__tabs">
                    <ul>
                        <li class="active">
                            <a href="<?=base_url('hesap-ayarlari')?>">Üyelik Bilgilerim</a>
                        </li>
                        <li>
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
                        <h1>Üyelik Bilgilerim</h1>
                    </div>
                    <div class="detail__form">
                        <?php echo form_open(base_url('user/change_name'));?>
                        <?php $this -> load -> view ('includes/msg_error'); ?>
                        <div class="group__flex">
                            <div class="input__group">
                                <label for="user-name">İsim Soyisim</label>
                                <input type="text" name="user_name" id="user-name" value="<?=$user -> user_name;?>">
                            </div>
                            <div class="input__group">
                                <label for="user_email">E-Mail</label>
                                <input type="text" name="user_email" id="user_email" value="<?=$user -> user_email;?>" disabled>
                            </div>
                        </div>
                        <button type="submit">BİLGİLERİMİ KAYDET</button>
                        <?php echo form_close(); ?>
                        <?php echo form_open(base_url('user/change_password')); ?>
                        <div class="group__flex">
                            <div class="input__group">
                                <label for="user_oldpassword">Eski Şifreniz</label>
                                <input type="password" name="user_oldpassword" id="user_oldpassword" placeholder="Eski Şifreniz">
                            </div>
                            <div class="input__group">
                                <label for="user_password">Yeni Şifreniz</label>
                                <input type="password" name="user_password" id="user_oldpassword" placeholder="Yeni Şifreniz">
                            </div>
                        </div>
                        <button type="submit">ŞİFRE DEĞİŞTİR</button>
                        <?php echo form_close(); ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <?php $this -> load -> view ('includes/scripts'); ?>
</body>
</html>