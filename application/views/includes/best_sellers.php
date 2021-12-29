<section id="best-seller">
    <div class="container">
        <div class="title">
            <p>En Çok Satan Ürünler</p>
        </div>
        <div class="best__seller">
            <div class="swiper top-seller">
                <div class="swiper-wrapper">
                    <?php foreach ( $best_sellers as $product) : ?>
                    <div class="swiper-slide">
                        <div class="product">
                            <div class="product__image">
                                <a href="<?=base_url( $product -> product_url);?>">
                                    <img src="<?=base_url('public/uploads/' . $product -> product_image);?>" alt="">
                                </a>
                            </div>
                            <div class="product__title">
                                <p><?=word_limiter($product -> product_name, 5, ' ...');?></p>
                            </div>
                            <div class="product__price">
                                <p><?=number_format( $product -> product_price, 2, ',', '.');?><span>TL</span></p>
                            </div>
                        </div>
                    </div>
                    <?php endforeach; ?>
                </div>
            </div>
        </div>
    </div>
</section>