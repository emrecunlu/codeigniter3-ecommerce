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
    
        <?php $this -> load -> view ( 'includes/best_sellers'); ?>

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