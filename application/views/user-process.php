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
    <div class="body">
        <div class="container-fluid form-container">
            <div class="user__form">
                <div class="form__links">
                    <ul>
                        <li class="active tab__link">Giriş Yap</li>
                        <li class="tab__link">Üye Ol</li>
                    </ul>
                </div>
                <div class="forms">
                    <div class="login__form form__user active">
                        <form action="" method="post">
                            <div class="input__group">
                                <label for="login-mail">E-Mail</label>
                                <input type="text" name="" id="login-mail" placeholder="ad.soyad@example.com">
                            </div>
                            <div class="input__group">
                                <label for="login-password">E-Mail</label>
                                <div class="show__input">
                                    <input type="text" name="" id="login-password" placeholder="****">
                                    <i class="fa fa-eye show-password" aria-hidden="true"></i>
                                </div>
                            </div>
                            <button type="submit" id="login-btn" name="login-btn">GİRİŞ YAP</button>
                        </form>
                    </div>
                    <div class="register__form form__user">
                        <form action="" method="post">
                            <div class="input__group">
                                <label for="register-name">İsim Soyisim</label>
                                <input type="text" name="" id="login-mail" placeholder="ad.soyad@example.com">
                            </div>
                            <div class="input__group">
                                <label for="login-mail">E-Mail</label>
                                <input type="text" name="" id="login-mail" placeholder="ad.soyad@example.com">
                            </div>
                            <div class="input__group">
                                <label for="login-password">Şifre</label>
                                <div class="show__input">
                                    <input type="text" name="" id="login-password" placeholder="****">
                                    <i class="fa fa-eye show-password" aria-hidden="true"></i>
                                </div>
                            </div>
                            <div class="input__group">
                                <label for="login-password">Şifre(Tekrar)</label>
                                <div class="show__input">
                                    <input type="text" name="" id="login-password" placeholder="****">
                                    <i class="fa fa-eye show-password" aria-hidden="true"></i>
                                </div>
                            </div>
                            <button type="submit" id="login-btn" name="login-btn">KAYIT OL</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
    <script src="assets/js/index.js"></script>
    <script>
        let showBtn = document.querySelectorAll('.show-password');
        let tabLinks = document.querySelectorAll('.tab__link');
        let tabContent = document.querySelectorAll('.form__user')

        function removeAllActives(item) {
            item.forEach(link => {
               link.classList.remove('active'); 
            });
        } 

        tabLinks.forEach((item, key) => {
            item.addEventListener('click', e => {
                removeAllActives(tabLinks);
                removeAllActives(tabContent);
                e.target.classList.add('active');
                tabContent[key].classList.add('active');
            });
        });

        showBtn.forEach(btn => {
            btn.addEventListener('click', e => {
                let thisInput = e.target.closest('.show__input').children[0];

                if (thisInput.getAttribute('type') === 'text') thisInput.setAttribute('type', 'password');
                else {
                    thisInput.setAttribute('type', 'text');
                }
            });
        });
    </script>
</body>
</html>