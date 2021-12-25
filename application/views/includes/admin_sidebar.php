<nav id="sidebar" class="active">
    <div class="sidebar-header">
        <img src="<?=base_url('admin/img/bootstraper-logo.png');?>" alt="bootraper logo" class="app-logo">
    </div>
    <ul class="list-unstyled components text-secondary">
        <li>
            <a href="dashboard.php"><i class="fas fa-home"></i> Dashboard</a>
        </li>
        <li>
            <a href="#productsmenu" data-bs-toggle="collapse" aria-expanded="false" class="dropdown-toggle no-caret-down"><i class="fas fa-copy"></i> Ürünler</a>
            <ul class="collapse list-unstyled" id="productsmenu">
                <li>
                    <a href="<?=base_url('adminpanel/showProducts');?>"><i class="fas fa-table"></i> Tüm Ürünler</a>
                </li>
                <li>
                    <a href="<?=base_url('adminpanel/addProduct');?>"><i class="fas fa-plus-circle"></i> Ürün Ekle</a>
                </li>
            </ul>
        </li>
        <li>
            <a href="users.html"><i class="fas fa-user-friends"></i>Kullanıcılar</a>
        </li>
        <li>
            <a href="settings.html"><i class="fas fa-cog"></i>Ayarlar</a>
        </li>
    </ul>
</nav>