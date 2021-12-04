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
    <div class="body">
        <div class="container-fluid form-container">
            <div class="user__form">
                <div class="form__links">
                    <ul>
                        <li class="tab__link">
                            <a href="<?=base_url('giris-yap')?>">
                                Giriş Yap
                            </a>
                        </li>
                        <li class="tab__link active">
                            <a href="<?=base_url('kayit-ol')?>">
                                Kayıt Ol
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="forms">
                    <?php $this -> load -> view ('includes/msg_error.php'); ?>
                    <div class="register__form form__user active">
                        <?php echo form_open(base_url('user/register')); ?>
                            <div class="input__group">
                                <label for="user-name">İsim Soyisim</label>
                                <input type="text" name="user_name" id="user-name" placeholder="ad soyad" required>
                            </div>
                            <div class="input__group">
                                <label for="user-mail">E-Mail</label>
                                <input type="email" name="user_email" id="user-mail" placeholder="ad.soyad@example.com" required>
                            </div>
                            <div class="input__group">
                                <label for="user-password">Şifre</label>
                                <div class="show__input">
                                    <input type="password" name="user_password" id="user-password" placeholder="****">
                                    <i class="fa fa-eye show-password" aria-hidden="true" required></i>
                                </div>
                            </div>
                            <div class="input__group">
                                <label for="user-repassword">Şifre(Tekrar)</label>
                                <div class="show__input">
                                    <input type="password" name="user_repassword" id="user-repassword" placeholder="****">
                                    <i class="fa fa-eye show-password" aria-hidden="true" required></i>
                                </div>
                            </div>
                            <button type="submit" id="login-btn" name="login-btn">KAYIT OL</button>
                        <?php echo form_close(); ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <?php $this -> load -> view ('includes/scripts.php'); ?>
    <script>
        let showBtn = document.querySelectorAll('.show-password');

        showBtn.forEach(btn => {
            btn.addEventListener('click', e => {
                let thisInput = e.target.closest('.show__input').children[0];

                if (thisInput.getAttribute('type') === 'text') thisInput.setAttribute('type', 'password');
                else {
                    thisInput.setAttribute('type', 'text');
                }
            });
        });
    </script>
</body>
</html>