<?php if (!empty ($adresses)) : ?>
    <div class="adresses">
        <?php foreach ( $adresses as $adress) : ?>
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
                    <p class="fw-bold"><?=$adress -> sehir_title;?> / <?=$adress -> ilce_title;?></p>
                </div>
            </div>
            <div class="adress__remove">
                <?php echo form_open('user/delete_adress'); ?>
                    <input type="hidden" name="adress_id" value="<?=$this -> encryption -> encrypt ($adress -> adress_id);?>">
                    <button type="submit">
                        <p>Sil</p>
                        <i class="fa fa-minus-circle" aria-hidden="true"></i>
                    </button>
                <?php echo form_close(); ?>
            </div>
        </div>
        <?php endforeach; ?>
    </div>
<?php endif; ?>