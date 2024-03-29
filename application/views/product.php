<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <?php $this -> load -> view ('includes/links.php'); ?>
</head>

<body>
    <?php $this -> load -> view ('includes/header'); ?>
    <?php $this -> load -> view ('includes/navbar'); ?>
    <div class="body">
        <div class="container">
            <div class="product__inner">
                <div class="inner_left">
                    <div class="swiper inner-product">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide">
                                <img src="<?=base_url('public/uploads/' . $product -> product_image);?>"
                                    alt="<?=$product -> product_url?>">
                            </div>
                            <?php foreach ($images as $image) : ?>
                            <div class="swiper-slide">
                                <img src="<?=base_url('public/uploads/' . $image -> image_path);?>"
                                    alt="<?=$product -> product_url?>">
                            </div>
                            <?php endforeach; ?>
                        </div>
                        <div class="swiper-button-prev"></div>
                        <div class="swiper-button-next"></div>
                        <div class="swiper-pagination"></div>
                    </div>
                </div>
                <div class="inner_right">
                    <div class="product__code">
                        <p><?=$product -> category_name?> / <?=$product -> product_id?></p>
                    </div>
                    <div class="product__title">
                        <p><?=$product -> product_name;?></p>
                    </div>
                    <div class="product__price">
                        <p><?=number_format($product -> product_price, 2, ',', '.');?><span>TL</span></p>
                    </div>
                    <?php if ( !empty($options)) : ?>
                    <div class="product__options">
                        <?php foreach ($options as $key => $option) : ?>
                        <div class="option">
                            <input type="checkbox" class="selection__product"
                                name="option-<?=$option -> option_value;?>" id="option-<?=$option -> option_value;?>"
                                value="<?=$option -> option_id;?>" <?=$key == 0 ? 'checked' : null ?>>
                            <label for="option-<?=$option -> option_value;?>"><?=$option -> option_value;?></label>
                        </div>
                        <?php endforeach; ?>
                    </div>
                    <?php else : ?>
                    <div class="py-4"></div>
                    <?php endif; ?>
                    <div class="add-to__basket">
                        <button type="button" id="add-to-basket">
                            <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                            <span>SEPETE EKLE</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <?php $this -> load -> view ( 'includes/best_sellers'); ?>

    <div class="backdrop">
        <div class="spinner-grow text-light" role="status">
            <span class="visually-hidden">Loading...</span>
        </div>
    </div>
    <input type="hidden" id="product-id" value="<?=$this -> encryption -> encrypt ($product -> product_id)?>">
    <?php $this -> load -> view ('includes/scripts'); ?>
    <script>
    const productImages = document.querySelectorAll('.swiper-slide > img');
    let imagesArr = [],
        productOptions = document.querySelectorAll('.selection__product');

    function unselected(items) {
        productOptions.forEach(option => {
            option.checked = false;
        });
    }

    productOptions.forEach(option => {
        option.addEventListener('click', e => {
            unselected(productOptions);
            e.target.checked = true;
        });
    });

    productImages.forEach((item, key) => {
        imagesArr[key] = {
            src: item.getAttribute('src'),
            alt: item.getAttribute('alt')
        }
    });

    const bestSeller = new Swiper('.swiper.top-seller', {
        direction: 'horizontal',
        loop: true,
        slidesPerView: 'auto',
        spaceBetween: 20,
    });
    const innerSwiper = new Swiper('.swiper.inner-product', {
        direction: 'horizontal',
        loop: true,
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        pagination: {
            el: '.swiper-pagination',
            clickable: true,
            renderBullet: function(index, className) {
                return '<span class="' + className + '"><img src="' + imagesArr[index].src + '" alt="' +
                    imagesArr[index].alt + '"></img></span>'
            }
        },
        autoplay: {
            delay: 5000,
        },
    });
    </script>
    <script>
    $('#add-to-basket').click(function() {

        $.ajax({
            type: 'POST',
            url: '<?=base_url('api/add_basket');?>',
            data: {
                'product_id': $('#product-id').val(),
                'product_option': $('.selection__product:checked').val(),
            },
            dataType: 'JSON',

            beforeSend: function() {

                $('.backdrop').addClass('active');

            },
            success: function(response) {

                toastr.options = {
                    "closeButton": true,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": true,
                    "positionClass": "toast-top-right",
                    "preventDuplicates": false,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                }

                if (response.status === 'OK') {

                    toastr["success"](response.message, "Sepete Eklendi!");

                    $('.total__basket').html(response.basket_qty);

                } else {

                    toastr["danger"](response.message, "Hata!");

                }

                setTimeout(function() {

                    $('.backdrop').removeClass('active');

                }, 800);

            }
        })

    });
    </script>
</body>

</html>