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
        <section id="slider" class="py-4">
            <div class="container">
                <div class="swiper thumbs-gallery">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide">
                            <img src="https://cdn.vatanbilgisayar.com/Upload/BANNER//yeni-tasarim/anasayfa/10-2021/asus-notebook-1-11-ILAN_WEB.jpg"
                                alt="">
                        </div>
                        <div class="swiper-slide">
                            <img src="https://cdn.vatanbilgisayar.com/Upload/BANNER//yeni-tasarim/anasayfa/10-2021/philips-20-10-ILAN_WEB.jpg"
                                alt="">
                        </div>
                        <div class="swiper-slide">
                            <img src="https://cdn.vatanbilgisayar.com/Upload/BANNER//yeni-tasarim/anasayfa/10-2021/1336x380-Vatan.jpg"
                                alt="">
                        </div>
                        <div class="swiper-slide">
                            <img src="https://cdn.vatanbilgisayar.com/Upload/BANNER//yeni-tasarim/anasayfa/10-2021/Vatan_iPad_mini_Web.jpg"
                                alt="">
                        </div>
                        <div class="swiper-slide">
                            <img src="https://cdn.vatanbilgisayar.com/Upload/BANNER//yeni-tasarim/anasayfa/10-2021/asus-notebook-1-11-ILAN_WEB.jpg"
                                alt="">
                        </div>
                        <div class="swiper-slide">
                            <img src="https://cdn.vatanbilgisayar.com/Upload/BANNER//yeni-tasarim/anasayfa/10-2021/philips-20-10-ILAN_WEB.jpg"
                                alt="">
                        </div>
                        <div class="swiper-slide">
                            <img src="https://cdn.vatanbilgisayar.com/Upload/BANNER//yeni-tasarim/anasayfa/10-2021/1336x380-Vatan.jpg"
                                alt="">
                        </div>
                        <div class="swiper-slide">
                            <img src="https://cdn.vatanbilgisayar.com/Upload/BANNER//yeni-tasarim/anasayfa/10-2021/Vatan_iPad_mini_Web.jpg"
                                alt="">
                        </div>
                    </div>
                    <div class="swiper-pagination"></div>
                    <div class="swiper-pagination-mb"></div>
                </div>
            </div>
        </section>
        <section id="products" style="padding: 50px 0;">
            <div class="container">
                <div class="product__list">
                    <span>Günün Fırsatları</span>
                    <div class="all__products">
                        <a href="#">TÜM FIRSAT ÜRÜNLERİ
                            <i class="fa fa-long-arrow-right" aria-hidden="true"></i>
                        </a>
                    </div>
                </div>
                <?php $this -> load -> view ('includes/all_products') ?>
            </div>
        </section>

        <?php $this -> load -> view ( 'includes/best_sellers'); ?>

    </div>
    <?php $this -> load -> view ('includes/scripts'); ?>
    <script>
    const bestSeller = new Swiper('.swiper.top-seller', {
        direction: 'horizontal',
        loop: true,
        slidesPerView: 'auto',
        spaceBetween: 20,
    });
    </script>
    <?php if ( $this -> session -> flashdata ('login')) : ?>
    <script>
    toastr['success']('Giriş Başarılı.', '<?=$this -> session -> flashdata ("success");?>')
    </script>
    <?php endif; ?>
    <?php $this -> load -> view ('includes/payment_messages'); ?>

</body>

</html>