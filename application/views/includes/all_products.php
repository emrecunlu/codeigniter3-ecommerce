<div class="products">
        <?php foreach ($products as $product) : ?>
        <div class="product">
            <div class="product__header">
                <div class="product__image">
                    <a href="<?=base_url($product -> product_url)?>">
                        <img src="<?=base_url('public/uploads/' . $product -> product_image);?>" alt="<?=$product -> product_url?>">
                    </a>
                </div>
                <div class="product__code py-2">
                    <a href="<?=base_url($product -> product_url)?>"><?=$product -> category_name?> / <?=$product -> product_id?></a>
                </div>
                <div class="product__title">
                    <a href="<?=base_url($product -> product_url)?>"><?=word_limiter($product -> product_name, 10, ' ...')?></a>
                </div>
            </div>
            <div class="product__bottom">
                <div class="product__price">
                    <p><?=number_format($product -> product_price, 2, ',', '.');?><span>TL</span></p>
                </div>
            </div>
        </div>
        <?php endforeach; ?>
    </div>
    