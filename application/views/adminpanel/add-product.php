<!doctype html>
<!--
* Bootstrap Simple Admin Template
* Version: 2.1
* Author: Alexis Luna
* Website: https://github.com/alexis-luna/bootstrap-simple-admin-template
-->
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Forms | Bootstrap Simple Admin Template</title>
    <?php $this -> load -> view ('includes/admin_links'); ?>
</head>

<body>
<div class="wrapper">
    <!-- sidebar navigation component -->
    <?php $this -> load -> view ('includes/admin_sidebar'); ?>
    <!-- end of sidebar component -->
    <div id="body" class="active">
        <!-- navbar navigation component -->
        <?php $this -> load -> view ('includes/admin_navbar'); ?>
        <!-- end of navbar navigation -->
        <div class="content">
            <div class="container">
                <div class="page-title">
                    <h3>Forms</h3>
                </div>
                <?php $this -> load -> view ('includes/alert_errors'); ?>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">Ürün Ekle</div>
                            <div class="card-body">
                                <h5 class="card-title pt-3 pb-4">Ürün ekleme formu</h5>
                                <?php echo form_open(base_url('admin/add_product'), array ('enctype' => 'multipart/form-data')); ?>
                                    <div class="mb-3 row">
                                        <label class="col-sm-2">Ürün Başlık *</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="product_name" class="form-control" placeholder="deneme ürün başlık" required>
                                            <?=$this -> session -> flashdata ('name_error');?>
                                        </div>
                                    </div>
                                    <div class="line"></div><br>
                                    <div class="mb-3 row">
                                        <label class="col-sm-2">Ürün Fiyat *</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="product_price" class="form-control" placeholder="000.00" required>
                                            <?=$this -> session -> flashdata ('price_error');?>
                                        </div>
                                    </div>
                                    <div class="line"></div><br>
                                    <div class="mb-3 row">
                                        <label class="col-sm-2">Ürün Kategori *</label>
                                        <div class="col-sm-10 select">
                                            <select name="product_category" class="form-select" required>
                                                <option value="">Kategori seçiniz</option>
                                                <?php foreach ( $categories as $category) : ?>
                                                <option value="<?=$category -> category_id;?>"><?=$category -> category_name;?></option>
                                                <?php endforeach; ?>
                                            </select>
                                            <?=$this -> session -> flashdata ('category_error');?>
                                        </div>
                                    </div>
                                    <div class="line"></div><br>
                                    <div class="mb-3 row">
                                        <label class="col-sm-2">Ürün Durum *<br>
                                            <small class="text-info">Ürün Aktiflik Durumu</small>
                                        </label>
                                        <div class="col-sm-10">
                                            <div class="form-check form-switch">
                                                <input class="form-check-input" name="product_status" type="checkbox" id="flexSwitchCheckChecked" checked>
                                                <label class="form-check-label" for="flexSwitchCheckChecked">Ürün sayfada gözüksün mü ?</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="line"></div><br>
                                    <div class="mb-3 row">
                                        <label class="col-sm-2">Ürün Thumbnail *</label>
                                        <div class="col-sm-10">
                                            <input type="file" name="product_thumbnail" class="form-control" required>
                                            <?=$this -> session -> flashdata ('thumbnail_error');?>
                                        </div>
                                    </div>
                                    <div class="line"></div><br>
                                    <div class="mb-3 row">
                                        <label class="col-sm-2">Ürün Resimler</label>
                                        <div class="col-sm-10">
                                            <input type="file" name="product_images[]" class="form-control" multiple>
                                        </div>
                                    </div>
                                    <div class="line"></div><br>
                                    <div class="mb-3 row">
                                        <label class="col-sm-2">Ürün Seçenekler</label>
                                        <div class="col-sm-10 select">
                                            <div class="row">
                                                <div class="input-group">
                                                    <input type="text" class="form-control" placeholder="Siyah, Mavi, vb.." aria-label="Example text with button addon" aria-describedby="button-addon1" id="product-option">
                                                    <button class="btn btn-primary" type="button" id="add-option">Ekle!</button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-10 offset-sm-2 select">
                                            <br>
                                            <select name="product_options[]" multiple class="form-select" id="product-options">
                                                <option value="" disabled>Eklemek istediğiniz seçeneği seçiniz.</option>
                                            </select>
                                            <small class="form-text">Select for than one</small>
                                        </div>
                                    </div>
                                    <div class="line"></div><br>
                                    <div class="mb-3">
                                        <button type="submit" class="btn btn-primary mb-2"><i class="fas fa-save"></i> Ürün Ekle</button>
                                    </div>
                                <?php echo form_close(); ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="assets/js/form-validator.js"></script>
<?php $this -> load -> view ('includes/admin_scripts'); ?>
<script>
    $('#add-option').click ( function () {

        let productOption = $('#product-option').val().trim();

        if ( productOption !== '') {

            $('#product-options').append(`
                <option value="${productOption}">${productOption}</option>
            `);

            $('#product-option').val('');

        }

    });
</script>
</body>

</html>