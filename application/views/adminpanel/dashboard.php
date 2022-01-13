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
    <title>Dashboard | Bootstrap Simple Admin Template</title>
    <?php $this -> load -> view ('includes/admin_links'); ?>
</head>

<body>
    <div class="wrapper">
        <?php $this -> load -> view ('includes/admin_sidebar'); ?>
        <div id="body" class="active">
            <!-- navbar navigation component -->
            <?php $this -> load -> view ('includes/admin_navbar'); ?>
            <!-- end of navbar navigation -->
            <div class="content">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 page-header">
                            <div class="page-pretitle">Overview</div>
                            <h2 class="page-title">Dashboard</h2>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-md-6 col-lg-3 mt-3">
                            <div class="card">
                                <div class="content">
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <div class="icon-big text-center">
                                                <i class="teal fas fa-shopping-cart"></i>
                                            </div>
                                        </div>
                                        <div class="col-sm-8">
                                            <div class="detail">
                                                <p class="detail-subtitle">Yeni Sipariş </p>
                                                <span class="number"><?=is_null($monthly -> qty) ? 0 : $monthly -> qty;?></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="footer">
                                        <hr />
                                        <div class="stats">
                                            <i class="fas fa-calendar"></i> Bu ay için
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-6 col-lg-3 mt-3">
                            <div class="card">
                                <div class="content">
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <div class="icon-big text-center">
                                                <i class="olive fas fa-money-bill-alt"></i>
                                            </div>
                                        </div>
                                        <div class="col-sm-8">
                                            <div class="detail">
                                                <p class="detail-subtitle">Toplam Kazanç</p>
                                                <span class="number"><?=is_null($monthly -> subtotal) ? 0 : $monthly -> subtotal;?></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="footer">
                                        <hr />
                                        <div class="stats">
                                            <i class="fas fa-calendar"></i> Bu ay için
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-6 col-lg-3 mt-3">
                            <div class="card">
                                <div class="content">
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <div class="icon-big text-center">
                                                <i class="violet fas fa-shopping-cart"></i>
                                            </div>
                                        </div>
                                        <div class="col-sm-8">
                                            <div class="detail">
                                                <p class="detail-subtitle">YENİ SİPARİŞ</p>
                                                <span class="number"><?=is_null($weekly -> qty) ? 0 : $weekly -> qty;?></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="footer">
                                        <hr />
                                        <div class="stats">
                                            <i class="fas fa-stopwatch"></i> Bu hafta için
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-6 col-lg-3 mt-3">
                            <div class="card">
                                <div class="content">
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <div class="icon-big text-center">
                                                <i class="orange fas fa-money-bill-alt"></i>
                                            </div>
                                        </div>
                                        <div class="col-sm-8">
                                            <div class="detail">
                                                <p class="detail-subtitle">Toplam Kazanç</p>
                                                <span class="number"><?=is_null($weekly -> subtotal) ? 0 : $weekly -> subtotal;?></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="footer">
                                        <hr />
                                        <div class="stats">
                                            <i class="fas fa-envelope-open-text"></i> Bu hafta için
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="card">
                                        <div class="content">
                                            <div class="head">
                                                <h5 class="mb-0">Toplam Satış Grafiği (Aylık)</h5>
                                                <p class="text-muted">Aylık kaç ürün satıldığını gösterir.</p>
                                            </div>
                                            <div class="canvas-wrapper">
                                                <canvas class="chart" id="sales"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="card">
                                        <div class="content">
                                            <div class="head">
                                                <h5 class="mb-0">Toplam Kazanç Grafiği</h5>
                                                <p class="text-muted">Aylık kazancı gösterir.</p>
                                            </div>
                                            <div class="canvas-wrapper">
                                                <canvas class="chart" id="prices"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 
                        <div class="col-md-6">
                            <div class="card">
                                <div class="content">
                                    <div class="head">
                                        <h5 class="mb-0">Top Visitors by Country</h5>
                                        <p class="text-muted">Current year website visitor data</p>
                                    </div>
                                    <div class="canvas-wrapper">
                                        <table class="table table-striped">
                                            <thead class="success">
                                                <tr>
                                                    <th>Country</th>
                                                    <th class="text-end">Unique Visitors</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td><i class="flag-icon flag-icon-us"></i> United States</td>
                                                    <td class="text-end">27,340</td>
                                                </tr>
                                                <tr>
                                                    <td><i class="flag-icon flag-icon-in"></i> India</td>
                                                    <td class="text-end">21,280</td>
                                                </tr>
                                                <tr>
                                                    <td><i class="flag-icon flag-icon-jp"></i> Japan</td>
                                                    <td class="text-end">18,210</td>
                                                </tr>
                                                <tr>
                                                    <td><i class="flag-icon flag-icon-gb"></i> United Kingdom</td>
                                                    <td class="text-end">15,176</td>
                                                </tr>
                                                <tr>
                                                    <td><i class="flag-icon flag-icon-es"></i> Spain</td>
                                                    <td class="text-end">14,276</td>
                                                </tr>
                                                <tr>
                                                    <td><i class="flag-icon flag-icon-de"></i> Germany</td>
                                                    <td class="text-end">13,176</td>
                                                </tr>
                                                <tr>
                                                    <td><i class="flag-icon flag-icon-br"></i> Brazil</td>
                                                    <td class="text-end">12,176</td>
                                                </tr>
                                                <tr>
                                                    <td><i class="flag-icon flag-icon-id"></i> Indonesia</td>
                                                    <td class="text-end">11,886</td>
                                                </tr>
                                                <tr>
                                                    <td><i class="flag-icon flag-icon-ph"></i> Philippines</td>
                                                    <td class="text-end">11,509</td>
                                                </tr>
                                                <tr>
                                                    <td><i class="flag-icon flag-icon-nz"></i> New Zealand</td>
                                                    <td class="text-end">1,700</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card">
                                <div class="content">
                                    <div class="head">
                                        <h5 class="mb-0">Most Visited Pages</h5>
                                        <p class="text-muted">Current year website visitor data</p>
                                    </div>
                                    <div class="canvas-wrapper">
                                        <table class="table table-striped">
                                            <thead class="success">
                                                <tr>
                                                    <th>Page Name</th>
                                                    <th class="text-end">Visitors</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>/about.html <a href="#"><i class="fas fa-link blue"></i></a></td>
                                                    <td class="text-end">8,340</td>
                                                </tr>
                                                <tr>
                                                    <td>/special-promo.html <a href="#"><i class="fas fa-link blue"></i></a></td>
                                                    <td class="text-end">7,280</td>
                                                </tr>
                                                <tr>
                                                    <td>/products.html <a href="#"><i class="fas fa-link blue"></i></a></td>
                                                    <td class="text-end">6,210</td>
                                                </tr>
                                                <tr>
                                                    <td>/documentation.html <a href="#"><i class="fas fa-link blue"></i></a></td>
                                                    <td class="text-end">5,176</td>
                                                </tr>
                                                <tr>
                                                    <td>/customer-support.html <a href="#"><i class="fas fa-link blue"></i></a></td>
                                                    <td class="text-end">4,276</td>
                                                </tr>
                                                <tr>
                                                    <td>/index.html <a href="#"><i class="fas fa-link blue"></i></a></td>
                                                    <td class="text-end">3,176</td>
                                                </tr>
                                                <tr>
                                                    <td>/products-pricing.html <a href="#"><i class="fas fa-link blue"></i></a></td>
                                                    <td class="text-end">2,176</td>
                                                </tr>
                                                <tr>
                                                    <td>/product-features.html <a href="#"><i class="fas fa-link blue"></i></a></td>
                                                    <td class="text-end">1,886</td>
                                                </tr>
                                                <tr>
                                                    <td>/contact-us.html <a href="#"><i class="fas fa-link blue"></i></a></td>
                                                    <td class="text-end">1,509</td>
                                                </tr>
                                                <tr>
                                                    <td>/terms-and-condition.html <a href="#"><i class="fas fa-link blue"></i></a></td>
                                                    <td class="text-end">1,100</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        !-->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <?php $this -> load -> view ('includes/admin_scripts'); ?>

    <script>

        $(document).ready ( function () {

            $.post ('<?=base_url("admin/dashboard_cart");?>', {'<?=$this -> security -> get_csrf_token_name()?>': '<?=$this -> security -> get_csrf_hash()?>'}, response => {

                var salesCart = document.getElementById("sales");
                var priceChart = document.getElementById("prices");

                var myChart1 = new Chart(salesCart, {
                type: 'bar',
                data: {
                    labels: response.month,
                    datasets: [{
                        label: 'Miktar',
                        data: response.monthly_count,
                        backgroundColor: "rgba(48, 164, 255, 0.2)",
                        borderColor: "rgba(48, 164, 255, 0.8)",
                        fill: true,
                        borderWidth: 1
                    }]
                },
                options: {
                    animation: {
                        duration: 2000,
                        easing: 'easeOutQuart',
                    },
                    plugins: {
                        legend: {
                            display: false,
                            position: 'right',
                        },
                        title: {
                            display: true,
                            text: 'Number of Visitors',
                            position: 'left',
                        },
                    },
                }
                });

                // new
                var myChart2 = new Chart(priceChart, {
                type: 'line',
                data: {
                    labels: response.month,
                    datasets: [{
                            label: 'Tutar (TRY)',
                            data: response.subtotal,
                            backgroundColor: "rgba(76, 175, 80, 0.5)",
                            borderColor: "#6da252",
                            borderWidth: 1,
                    }]
                },
                options: {
                    animation: {
                        duration: 2000,
                        easing: 'easeOutQuart',
                    },
                    plugins: {
                        legend: {
                            display: false,
                            position: 'top',
                        },
                        title: {
                            display: true,
                            text: 'Number of Sales',
                            position: 'left',
                        },
                    },
                }
            });

            }, 'json');

            console.log ( cart1Labels);

        });

    </script>
</body>

</html>
