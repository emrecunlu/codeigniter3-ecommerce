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
                                            <button type="button" class="decrase__item">-</button>
                                            <input type="text" name="product-count" class="product__count" value="<?=$item['qty']?>">
                                            <button type="button" class="incrase__item">+</button>
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
                                    <input type="hidden" name="cart-rowid" value="<?=$item['rowid'];?>">
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
                            <p><?=number_format($this -> cart -> total () * 18 / 100, 2, ',',) ?> TL</p>
                        </div>
                        <div class="cart__total">
                            <h1>Toplam</h1>
                            <p><?=number_format($this -> cart -> total (), 2, ',', '.');?> TL</p>
                        </div>
                        <div class="cart__success">
                            <button type="button">Sepeti Onayla</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <?php $this -> load -> view ('includes/scripts'); ?>
</body>
</html>