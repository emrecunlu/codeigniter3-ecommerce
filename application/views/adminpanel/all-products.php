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
    <title>Users | Bootstrap Simple Admin Template</title>
    <?php $this -> load -> view ('includes/admin_links'); ?>
    <style>
        .product-img {
            width: 40px;
            height: 40px;
            background: #ccc;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 4px;
        }
        .product-img img {
            width: 30px;
            height: 30px;
            object-fit: cover;
            object-position: center;
        }
    </style>
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
                    <?php $this -> load -> view ('includes/alert_errors'); ?>
                    <div class="page-title">
                        <h3>Ürünler</h3>
                    </div>
                    <div class="modal fade" id="product-modal" role="dialog" tabindex="-1">
                        <div class="modal-dialog modal-xl">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Ürün Düzenleme</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body text-start">
                                    <p>Ürünü düzenlemek için aşşağıdaki formu doldurunuz.</p>
                                    <?php echo form_open(base_url('admin/update_product'), array ('enctype' => 'multipart/form-data')); ?>
                                    <div class="mb-3 row">
                                        <label class="col-sm-2">Ürün Başlık</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="product_name" class="form-control" placeholder="deneme ürün başlık" required>
                                            <?=$this -> session -> flashdata ('name_error');?>
                                        </div>
                                    </div>
                                    <div class="line"></div><br>
                                    <div class="mb-3 row">
                                        <label class="col-sm-2">Ürün Fiyat</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="product_price" class="form-control" placeholder="000.00" required>
                                            <?=$this -> session -> flashdata ('price_error');?>
                                        </div>
                                    </div>
                                    <div class="line"></div><br>
                                    <div class="mb-3 row">
                                        <label class="col-sm-2">Ürün Kategori</label>
                                        <div class="col-sm-10 select">
                                            <select name="product_category" class="form-select" required>
                                                <?php foreach ( $categories as $category) : ?>
                                                    <option value="<?=$category -> category_id;?>"><?=$category -> category_name;?></option>
                                                <?php endforeach; ?>
                                            </select>
                                            <?=$this -> session -> flashdata ('category_error');?>
                                        </div>
                                    </div>
                                    <div class="line"></div><br>
                                    <div class="mb-3 row">
                                        <label class="col-sm-2">Ürün Durum<br>
                                        </label>
                                        <div class="col-sm-10">
                                            <div class="form-check form-switch">
                                                <input class="form-check-input" name="product_status" type="checkbox" id="flexSwitchCheckDefault"> 
                                                <label class="form-check-label" for="flexSwitchCheckDefault">Ürün sayfada gözüksün mü ?</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="line"></div><br>
                                    <div class="mb-3 row">
                                        <label class="col-sm-2">Ürün Thumbnail</label>
                                        <div class="col-sm-10">
                                            <input type="file" name="product_thumbnail" class="form-control">
                                            <?=$this -> session -> flashdata ('thumbnail_error');?>
                                        </div>
                                    </div>
                                    <div class="line"></div><br>
                                    <div class="mb-3">
                                        <button type="submit" class="btn btn-primary mb-2"><i class="fas fa-save"></i> Ürün Düzenle</button>
                                    </div>
                                    <input type="hidden" name="product_id">
                                    <?php echo form_close(); ?>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="box box-primary">
                        <div class="box-body">
                            <table width="100%" class="table table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>Id</th>
                                        <th>Thumbnail</th>
                                        <th>İsim</th>
                                        <th>Fiyat</th>
                                        <th>Kategori</th>
                                        <th>Durum</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ( $products as $product) : ?>
                                    <tr data-id="<?=$this -> encryption -> encrypt ($product -> product_id);?>">
                                        <td><?=$product -> product_id;?></td>
                                        <td>
                                            <div class="product-img">
                                                <img src="<?=base_url('public/uploads/' . $product -> product_image);?>" alt="<?=$product -> product_url;?>">
                                            </div>
                                        </td>
                                        <td><?=word_limiter($product -> product_name, 10, ' ...');?></td>
                                        <td><?=number_format($product -> product_price, 2, ',',  '.');?> TL</td>
                                        <td><?=$product -> category_name;?></td>
                                        <td><?=$product -> is_live == TRUE ? 'Aktif' : 'Pasif';?></td>
                                        <td class="text-end">
                                            <span class="change-icon btn btn-outline-info btn-rounded"><i class="fas fa-pen"></i></span>
                                            <span class="delete-icon btn btn-outline-danger btn-rounded"><i class="fas fa-trash"></i></span>
                                        </td>
                                    </tr>
                                    <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="backdrop">
        <div class="spinner-grow text-light" role="status">
            <span class="visually-hidden">Loading...</span>
        </div>
    </div>  
    <?php $this -> load -> view ('includes/admin_scripts'); ?>

    <script>
        $('.change-icon').click ( function () {

            let productID = $(this).closest('tr').data('id');

            $.ajaxSetup({beforeSend: function () { $('.backdrop').addClass('active'); }});

            $.post('<?=base_url("admin/get_product")?>', {product_id: productID}, function ( response) {
                
                if ( response.status == 'success') {

                    setTimeout( function () {

                        let category_id = response.product.category_id;
                        let status = response.product.is_live === '1' ? true : false;
                        
                        $('input[name="product_id"]').val(response.product.product_id);
                        $('input[name="product_name"]').val(response.product.product_name);
                        $('input[name="product_price"]').val(response.product.product_price);
                        $(`select[name="product_category"] option[value="${category_id}"]`).prop('selected', true);
                        $('input[name="product_status"]').prop('checked', status);
                    
                        $('.backdrop').removeClass('active');

                        $('.modal').modal('show');

                    }, 500);

                }

            }, 'json');

        });
    </script>
    <script>
        $('.delete-icon').click ( function () {

            let productID = $(this).closest('tr').data('id');

            let thisRow = $(this).closest('tr');

            $('.backdrop').addClass('active');

            $.post('<?=base_url("admin/delete")?>', {product_id: productID}, function ( response) {

                setTimeout( function () {

                    if ( response.status === 'success') {

                        thisRow.fadeOut(500);

                        setTimeout( function () {

                            thisRow.remove ();

                        }, 500);

                        $('.backdrop').removeClass('active');

                        toastr['success']('Başarılı', response.message);

                    } else if ( response.status === 'error') {

                        $('.backdrop').removeClass('active');

                        toastr['error']('Hata', response.message);

                    }

                }, 500);

            }, 'json');

        });
    </script>

    <?php $this -> load -> view ('includes/toastr'); ?>

</body>

</html>