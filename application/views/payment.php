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
        <?php if ( $this -> cart -> contents ()) : ?>
        <div class="user__cart">
            <div class="container">
                <?=form_open (base_url('odeme'), array ('id' => 'payment-form'));?>
                <div class="cart__wrapper">
                    <div class="cart__products">
                        <div class="payment__title">
                            <h1>Adres</h1>
                            <button type="button" class="pri__btn"
                                onclick="window.location = '<?=base_url('adreslerim');?>'">YENİ ADRES EKLE</button>
                        </div>
                        <?php if (!empty ($adresses)) : ?>
                        <div class="adresses payment">
                            <?php foreach ( $adresses as $index => $adress) : ?>
                            <input type="checkbox" <?=$index === 0 ? 'checked' : null; ?> class="adress__hidden"
                                name="adress_id" id="adress-<?=$index;?>"
                                value="<?=$this -> encryption -> encrypt ($adress -> adress_id)?>">
                            <label for="adress-<?=$index;?>" class="adress-label">
                                <div class="adress">
                                    <div class="adress__info">
                                        <div class="adress__title">
                                            <h1><?=$adress -> adress_title;?></h1>
                                        </div>
                                        <div class="personal__name mb-2 fw-bold">
                                            <p><?=$adress -> user_name;?></p>
                                        </div>
                                        <div class="adress__content">
                                            <p><?=$adress -> user_adress;?></p>
                                        </div>
                                        <div class="adress-il__ilce">
                                            <p class="fw-bold"><?=$adress -> sehir_title;?> /
                                                <?=$adress -> ilce_title;?></p>
                                        </div>
                                    </div>
                                </div>
                            </label>
                            <?php endforeach; ?>
                        </div>
                        <?php endif; ?>
                    </div>
                    <div class="cart__order">
                        <div class="cart__detail">
                            <h1>Sipariş Özeti</h1>
                        </div>
                        <div class="order__total">
                            <h1>Ara Toplam</h1>
                            <p><?=number_format($this -> cart -> total () - $this -> cart -> total () * 18 / 100, 2, ',', '.')?>
                                TL</p>
                        </div>
                        <div class="order__kdv">
                            <h1>KDV</h1>
                            <p><?=number_format($this -> cart -> total () * 18 / 100, 2, ',', '.') ?> TL</p>
                        </div>
                        <div class="cart__total">
                            <h1>Toplam</h1>
                            <p><?=number_format($this -> cart -> total (), 2, ',', '.');?> TL</p>
                        </div>
                        <div class="cart__success">
                            <button type="submit" id="payment-success">Ödemeye Geç</button>
                        </div>
                    </div>
                </div>
                <?php echo form_close(); ?>
            </div>
        </div>
        <?php else : ?>
        <div class="cart__empty">
            <div class="cart__icon">
                <i class="fa fa-shopping-cart" aria-hidden="true"></i>
            </div>
            <div class="cart__message">
                <h1>SEPETİNİZDE ÜRÜN YOK!</h1>
                <a href="<?=base_url();?>">ALIŞVERİŞE BAŞLA</a>
            </div>
        </div>
        <?php endif; ?>
    </div>
    <div class="backdrop">
        <div class="spinner-grow text-light" role="status">
            <span class="visually-hidden">Loading...</span>
        </div>
    </div>
    <?php $this -> load -> view ('includes/scripts'); ?>
    <script>
    function uncheckedAll() {

        $('.adress__hidden').each((index, item) => {

            $(item).prop('checked', false);

        });

    }

    $('.adress__hidden').change(function() {

        uncheckedAll();

        $(this).prop('checked', true);

    });

    $('#payment-form').submit(function(e) {

        if ($('.adress__hidden').is(':checked') == true) {

            return true;

        } else {

            toastr['error']('Hata', 'Lütfen geçerli bir adres seçiniz.');

            return false;

        }

    });
    </script>
</body>

</html>