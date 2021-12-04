    <header id="header">
        <div class="container">
            <div class="header-wrapper">
                <div class="header__toggler">
                    <div class="line-1"></div>
                    <div class="line-2"></div>
                    <div class="line-3"></div>
                </div>
                <div class="header__brand">
                    <a href="<?=base_url();?>">
                        <img src="https://upload.wikimedia.org/wikipedia/commons/2/20/BEAT_Cycling_logo.png" alt="">
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
                            <a href="<?=base_url('giris-yap');?>">
                                <i class="fa fa-user" aria-hidden="true"></i>
                                <span>HESAP</span>
                            </a>
                        </li>
                        <li>
                            <a href="<?=base_url('sepet');?>">
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
