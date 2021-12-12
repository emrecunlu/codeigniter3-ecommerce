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
<?php $this -> load -> view ('includes/header');     ?>
<?php $this -> load -> view ('includes/navbar'); ?>
    <div class="body">
        <?php if ( $this -> cart -> contents ()) : ?>
        <div class="user__cart">
            <div class="container">
                <div class="cart__wrapper">
                    <div class="cart__products">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Ürünlerim</th>
                                    <th class="text-center">Adet</th>
                                    <th class="text-center">Fiyat</th>
                                    <th class="text-center">Sil</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ( $this -> cart -> contents () as $item) : ?>
                                <tr>
                                    <td>
                                        <div class="product__thumb">
                                            <a href="<?=base_url($item['url']);?>">
                                                <img src="<?=base_url('public/uploads/' . $item['image']);?>" alt="<?=$item['url'];?>">
                                            </a>
                                        </div>
                                        <div class="product__name">
                                            <a href="<?=base_url($item['url']);?>"><?=word_limiter($item['name'], 10, ' ...') . ' - ' . $item['options']['value'];?></a>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="product__input">
                                            <input type="number" name="product-count" class="product__count" value="<?=$item['qty']?>">
                                        </div>
                                    </td>
                                    <td>
                                        <div class="product__price">
                                            <p><?=number_format($item['subtotal'], 2, ',', '.');?> TL</p>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="product__remove">
                                            <i class="fa fa-minus-circle" aria-hidden="true"></i>
                                        </div>
                                    </td>
                                    <input type="hidden" class="cart-rowid" name="cart-rowid" value="<?=$item['rowid'];?>">
                                </tr>
                                <?php endforeach; ?>
                            </tbody>
                        </table>
                    </div>
                    <div class="cart__order">
                        <div class="cart__detail">
                            <h1>Sipariş Özeti</h1>
                        </div>
                        <div class="order__total">
                            <h1>Ara Toplam</h1>
                            <p><?=number_format($this -> cart -> total () - $this -> cart -> total () * 18 / 100, 2, ',', '.')?> TL</p>
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
                            <a href="<?=base_url('siparisi-tamamla');?>">
                                <button type="button">Sepeti Onayla</button>
                            </a>
                        </div>
                    </div>
                </div>
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

            let oldQty;

            $('.product__count').change(function () {

                $(this).focusout();
                $(this).focus();

            });

            $('.product__remove > i').click( function () {
            
                let thisRow = $(this).closest('tr');

                thisRow.find('input[name="product-count"]').attr('value', 0).focusout();
                
            });

            $('.product__count').focus ( function () {

                oldQty = $(this).val ();

            });

            $('.product__count').focusout ( function () {

                let itemQty = $(this).val ();
                let rowid = $(this).closest('tr').find ('.cart-rowid').val ();
                let thisRow = $(this).closest('tr');

                if ( oldQty !== itemQty) {

                    if ( itemQty <= 0 || itemQty === '') itemQty = 0;

                    $.ajax ({

                        url: '<?=base_url('api/update_basket');?>',
                        type: 'POST',
                        data: {
                            rowid: rowid,
                            itemQty: itemQty,
                        },
                        dataType: 'JSON',

                        beforeSend: function () {

                            $('.backdrop').addClass('active');

                        },
                        success: function ( response) {

                            if ( response.status == 'OK') {
                                
                                thisRow.find ('.product__price > p').html (response.prop.urun_toplam + ' TL');
                                $('.order__total > p').html (response.prop.ara_toplam + ' TL');
                                $('.order__kdv > p').html (response.prop.kdv + ' TL');
                                $('.cart__total > p').html (response.prop.toplam + ' TL');
                                $('.total__basket').html (response.prop.baet_total);

                                toastr['success']('Başarılı', response.message);

                            } else if ( response.status == 'refresh') window.location = '';
                            else if ( response.status == 'error') {

                                toastr['error']('Hata', response.message);

                            }
 
                            setTimeout(function () {

                                $('.backdrop').removeClass('active'); 

                            }, 800) ;

                        }

                    })

                }

            });

    </script>
</body>
</html>