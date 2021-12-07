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
                        <?php foreach ($this -> categories -> get_all() as $category) : ?>
                        <li>
                            <a href="<?=base_url('kategori/' . $category -> category_url);?>"><?=$category -> category_name;?></a>
                        </li>
                        <?php endforeach; ?>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
