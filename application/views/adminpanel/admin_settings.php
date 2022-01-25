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
    <title>Forms | Bootstrap Simple Admin Template</title>
    <?php $this -> load -> view('includes/admin_links'); ?>
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
                <div class="page-title">
                    <h3>Admin</h3>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <?php $this -> load -> view ('includes/alert_errors'); ?>
                        <div class="card">
                            <div class="card-header">Admin Düzenle</div>
                            <div class="card-body">
                                <h5 class="card-title">Tek bir admin üzerinden site yönetilebilir.</h5>
                                <?php echo form_open(base_url('admin/change_password')); ?>
                                    <div class="mb-3">
                                        <label for="email" class="form-label">Email</label>
                                        <input type="email" name="email" placeholder="Email Address" class="form-control" value="<?=$this -> session -> userdata('admin') -> admin_email;?>" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="password" class="form-label">Şifre</label>
                                        <input type="password" name="password" placeholder="Password" class="form-control" required>
                                    </div>
                                    <div class="mb-3">
                                        <input type="submit" class="btn btn-primary" value="Güncelle">
                                    </div>
                                <?php echo form_close(); ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php $this -> load -> view('includes/admin_scripts'); ?>
</body>

</html>