<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
    <header id="header">
        <div class="container">
            <div class="header-wrapper">
                <div class="header__toggler">
                    <div class="line-1"></div>
                    <div class="line-2"></div>
                    <div class="line-3"></div>
                </div>
                <div class="header__brand">
                    <a href="#">
                        <img src="https://www.vatanbilgisayar.com/assets/dist/images/vatanlogo.svg" alt="">
                    </a>
                </div>
                <div class="search__bar">
                    <form action="" method="get">
                        <input type="text" name="search-bar" id="search-bar" placeholder="Aramak istediğiniz ürünü yazınız.">
                        <button type="submit">
                            <i class="fa fa-search" aria-hidden="true"></i>
                        </button>
                    </form>
                </div>
                <div class="user__items">
                    <ul>
                        <li class="active">
                            <a href="#">
                                <i class="fa fa-user" aria-hidden="true"></i>
                                <span>HESAP</span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                                <span>SEPET</span>
                                <div class="total__basket">0</div>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </header>
    <nav id="navbar">
        <div class="container">
            <div class="navbar__wrapper">
                <div class="close__nav">
                    <div class="login__in">
                        <a href="#">
                            <i class="fa fa-user"></i>
                            <span>Giriş Yap</span>
                        </a>
                    </div>
                    <div class="close">
                        <i class="fa fa-times" aria-hidden="true"></i>
                    </div>
                </div>
                <div class="nav__items">
                    <ul>
                        <li>
                            <a href="#">Telefon</a>
                        </li>
                        <li>
                            <a href="#">Bilgisayar</a>
                        </li>
                        <li>
                            <a href="#">Tv, Ev Elektroniği</a>
                        </li>
                        <li>
                            <a href="#">Bilgisayar Parçaları</a>
                        </li>
                        <li>
                            <a href="#">Foto, Kamera</a>
                        </li>
                        <li>
                            <a href="#">Tv, Ev Elektroniği</a>
                        </li>
                        <li>
                            <a href="#">Bilgisayar Parçaları</a>
                        </li>
                        <li>
                            <a href="#">Foto, Kamera</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
    <div class="body pt-1 pt-xl-0">
        <div class="container my-5">
            <div class="user__detail">
                <div class="detail__tabs">
                    <ul>
                        <li class="active">
                            <a href="#">Üyelik Bilgilerim</a>
                        </li>
                        <li>
                            <a href="#">Adres Bilgilerim</a>
                        </li>
                        <li>
                            <a href="#">Siparişlerim</a>
                        </li>
                        <li>
                            <a href="#">Çıkış Yap   </a>
                        </li>
                    </ul>
                </div>
                <div class="detail__contents">
                    <div class="detail__title">
                        <h1>Adress Bilgilerim</h1>
                    </div>
                    <div class="user__adress">
                        <form action="" method="post">
                            <div class="input__group">
                                <label for="">Adres Başlığı</label>
                                <input type="text" name="" id="">
                            </div>
                            <div class="flex__group">
                                <div class="input__group">
                                    <label for="">İsim Soyisim</label>
                                    <input type="text" name="" id="">
                                </div>
                                <div class="input__group">
                                    <label for="">Cep Telefonu</label>
                                    <input type="text" name="" id="">
                                </div>
                            </div>
                            <div class="input__group">
                                <label for="">Adres</label>
                                <textarea name="" id="" cols="30"></textarea>
                            </div>
                            <button type="submit">EKLE</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
    <script src="assets/js/index.js"></script>
</body>
</html>