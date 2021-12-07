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
    <div class="body py-4">
    <section id="best-seller">
            <div class="container">
                <div class="title">
                    <p>En Çok Satan Ürünler</p>
                </div>
                <div class="best__seller">
                    <div class="swiper top-seller">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide">
                                <div class="product">
                                    <div class="product__image">
                                        <a href="#">
                                            <img src="https://www.vatanbilgisayar.com/UPLOAD/PRODUCT/samsung/thumb/121933_small.jpg" alt="">
                                        </a>
                                    </div>
                                    <div class="product__title">
                                        <p>Xiaomi Redmi 9c 128 Gb Akıllı Telefon Mavi</p>
                                    </div>
                                    <div class="product__price">
                                        <p>9.999<span>TL</span></p>
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="product">
                                    <div class="product__image">
                                        <a href="#">
                                            <img src="https://www.vatanbilgisayar.com/UPLOAD/PRODUCT/samsung/thumb/121933_small.jpg" alt="">
                                        </a>
                                    </div>
                                    <div class="product__title">
                                        <p>Xiaomi Redmi 9c 128 Gb Akıllı Telefon Mavi</p>
                                    </div>
                                    <div class="product__price">
                                        <p>9.999<span>TL</span></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section id="products" style="padding: 50px 0;">
            <div class="container">
                <div class="product__list">
                    <span><?=$category_name;?></span>
                    <div class="all__products">
                        <a href="#">TÜM FIRSAT ÜRÜNLERİ
                        <i class="fa fa-long-arrow-right" aria-hidden="true"></i>
                        </a>
                    </div>
                </div>
            <?php $this -> load -> view ('includes/all_products') ?>
            <?php echo $links; ?>
            </div>
        </section>
    </div>
    <?php $this -> load -> view ('includes/scripts'); ?>
    <script>
        const bestSeller = new Swiper('.swiper.top-seller', {
            direction: 'horizontal',
            loop: true,
            slidesPerView: 'auto',
            spaceBetween: 20,
            autoplay: {
                delay: 5000,
            },
            freeMode: true
        });
    </script>
    <?php if ( $this -> session -> flashdata ('login')) : ?>
    <script>
        toastr['success']('Giriş Başarılı.', '<?=$this -> session -> flashdata ("success");?>')
    </script>
    <?php endif; ?>
</body>
</html>