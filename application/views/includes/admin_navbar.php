<nav class="navbar navbar-expand-lg navbar-white bg-white">
    <button type="button" id="sidebarCollapse" class="btn btn-light">
        <i class="fas fa-bars"></i><span></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="nav navbar-nav ms-auto">
            <li class="nav-item dropdown">
                <div class="nav-dropdown">
                    <div class="dropdown-menu dropdown-menu-end nav-link-menu" aria-labelledby="nav1">
                        <ul class="nav-list">
                            <li><a href="" class="dropdown-item"><i class="fas fa-list"></i> Access Logs</a></li>
                            <div class="dropdown-divider"></div>
                            <li><a href="" class="dropdown-item"><i class="fas fa-database"></i> Back ups</a></li>
                            <div class="dropdown-divider"></div>
                            <li><a href="" class="dropdown-item"><i class="fas fa-cloud-download-alt"></i> Updates</a></li>
                            <div class="dropdown-divider"></div>
                            <li><a href="" class="dropdown-item"><i class="fas fa-user-shield"></i> Roles</a></li>
                        </ul>
                    </div>
                </div>
            </li>
            <li class="nav-item dropdown">
                <div class="nav-dropdown">
                    <a href="#" id="nav2" class="nav-item nav-link dropdown-toggle text-secondary" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fas fa-user"></i> <span>Admin</span> <i style="font-size: .8em;" class="fas fa-caret-down"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-end nav-link-menu">
                        <ul class="nav-list">
                            <li><a href="<?=base_url('admin/logout')?>" class="dropdown-item"><i class="fas fa-sign-out-alt"></i> Çıkış Yap</a></li>
                        </ul>
                    </div>
                </div>
            </li>
            <li class="nav-item dropdown">
                <div class="nav-dropdown">
                    <div class="dropdown-menu dropdown-menu-end nav-link-menu">
                        <ul class="nav-list">
                            <li><a href="<?=base_url('admin/logout')?>" class="dropdown-item"><i class="fas fa-sign-out-alt"></i> Çıkış Yap</a></li>
                        </ul>
                    </div>
                </div>
            </li>
        </ul>
    </div>
</nav>