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
                        <li class="tab__link active">
                            <a href="<?=base_url('giris-yap')?>">
                                Giriş Yap
                            </a>
                        </li>
                        <li class="tab__link">
                            <a href="<?=base_url('kayit-ol')?>">
                                Kayıt Ol
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="forms">
                    <div class="login__form form__user active">
                        <?php $this -> load -> view ('includes/msg_error.php'); ?>
                        <?php echo form_open(base_url('user/login')); ?>
                        <div class="input__group">
                            <label for="user-mail">E-Mail</label>
                            <input type="email" name="user_email" id="user-email" placeholder="ad.soyad@example.com">
                        </div>
                        <div class="input__group">
                            <label for="user-password">Şifre</label>
                            <div class="show__input">
                                <input type="password" name="user_password" id="user-email" placeholder="****">
                                <i class="fa fa-eye show-password" aria-hidden="true"></i>
                            </div>
                        </div>
                        <button type="submit" id="login-btn" name="login-btn">GİRİŞ YAP</button>
                        <?php form_close(); ?>
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
    <?php if ( $this -> session -> flashdata ('logout')) : ?>
    <script>
    toastr['error']('Güvenli Çıkış.', '<?=$this -> session -> flashdata ("logout");?>')
    </script>
    <?php endif; ?>
</body>

</html>