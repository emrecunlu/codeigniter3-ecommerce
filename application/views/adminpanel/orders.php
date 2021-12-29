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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.3.0/dist/sweetalert2.min.css">
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
                        <h3>Siparişler</h3>
                    </div>
                    <div class="box box-primary">
                        <div class="box-body">
                            <table width="100%" class="table table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>Müşteri İsim</th>
                                        <th>Ürün</th>
                                        <th>Adet</th>
                                        <th>Toplam Fiyat</th>
                                        <th>Sipariş No</th>
                                        <th>Tarih</th>
                                        <th>İşlem</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ( $orders as $order) : ?>
                                    <tr data-id="<?=$order -> order_id;?>">
                                        <td><?=$order -> user_name;?></td>
                                        <td><?=word_limiter($order -> product_name, 10, ' ...') . ' ' . $order -> option_value;?></td>
                                        <td><?=$order -> quantity;?></td>
                                        <td><?=number_format($order -> total_price, 2, ',', '.');?> ₺</td>
                                        <td><?=$order -> order_no;?></td>
                                        <td><?=mdate('%d.%m.%y <br> %h:%i', strtotime($order -> purchase_date));?></td>
                                        <td>
                                            <button type="button" class="btn btn-icon icon-left btn-danger mb-2 repay-btn"><i class="fas fa-exclamation-triangle"></i> İade Et</button>
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

    <?php $this -> load -> view ('includes/toastr'); ?>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.3.0/dist/sweetalert2.all.min.js"></script>

    <script>
        
        $('.repay-btn').click ( function () {

            const orderId = $(this).closest('tr').data('id');
            let thisRow = $(this).closest('tr');
                
            Swal.fire({
                icon: 'warning',
                title: '<b>İade işlemini onaylıyor musunuz ?</b>',
                showCancelButton: true,
                confirmButtonText: 'Evet',
                cancelButtonText: 'Hayır'
            }).then(result => {
                if ( result.isConfirmed) {

                    $.post ('<?=base_url("admin/order")?>', { order_id: orderId, request: 'refund'}, response => {

                        if ( response.status === 'success') {

                            toastr['success']('Başarılı', response.message);

                            thisRow.fadeOut ();

                        } else if ( response.status === 'error') {

                            toastr['error']('Hata', response.message);

                        }

                    }, 'json');
                    
                }
            });
            
        });

    </script>

</body>

</html>