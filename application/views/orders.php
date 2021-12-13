<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.1/semantic.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/dataTables.semanticui.min.css">
    <?php $this -> load -> view ('includes/links'); ?>
</head>
<body>
<?php $this -> load -> view ('includes/header') ?>
<?php $this -> load -> view ('includes/navbar') ?>
    <div class="body pt-1 pt-xl-0">
        <div class="container my-xl-5 my-0">
            <div class="user__detail">
                <div class="detail__tabs">
                    <ul>
                        <li>
                            <a href="<?=base_url('hesap-ayarlari')?>">Üyelik Bilgilerim</a>
                        </li>
                        <li>
                            <a href="<?=base_url('adreslerim');?>">Adres Bilgilerim</a>
                        </li>
                        <li class="active">
                            <a href="<?=base_url('siparislerim');?>">Siparişlerim</a>
                        </li>
                        <li>
                            <a href="<?=base_url('user/logout');?>">Çıkış Yap</a>
                        </li>
                    </ul>
                </div>
                <div class="detail__contents">  
                    <div class="detail__title">
                        <h1>Siparişlerim</h1>
                    </div>
                    <div class="orders">
                        <table id="example" class="ui celled table" style="width:100%">
                            <thead>
                                <tr>
                                    <th>Ürün</th>
                                    <th>Ürün İsim</th>
                                    <th>Ürün Adet</th>
                                    <th>Toplam Fiyat</th>
                                    <th>Sipariş Tarihi</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ( $orders as $order) : ?>
                                    <tr>
                                        <td>
                                            <div class="product__img">
                                                <img src="<?=base_url('public/uploads/' . $order -> product_image);?>" alt="">
                                            </div>
                                        </td>
                                        <td>
                                            <div class="product__name">
                                                <h1><?=$order -> product_name;?></h1>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="product__qty">
                                                <p><?=$order -> quantity;?></p>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="product-total__price">
                                                <p><?=number_format($order -> total_price, 2, ',', '.');?> TL</p>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="purchase__date">
                                                <p><?=nice_date($order -> purchase_date, 'Y-m-d');?></p>
                                            </div>
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
    <?php $this -> load -> view ('includes/scripts'); ?>
    <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.3/js/dataTables.semanticui.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.1/semantic.min.js"></script>
    <script>
        $(document).ready ( function () {
            $('#example').DataTable ({
                responsive: true,
                language: {
                    'url': 'https://cdn.datatables.net/plug-ins/1.11.3/i18n/tr.json'
                }
            });
        });
    </script>
</body>
</html>