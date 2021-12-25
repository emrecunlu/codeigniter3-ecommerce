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
    <title>Login | Bootstrap Simple Admin Template</title>
    <link href="<?=base_url('admin/vendor/bootstrap/css/bootstrap.min.css')?>" rel="stylesheet">
    <link href="<?=base_url('admin/vendor/fontawesome/css/fontawesome.min.css')?>" rel="stylesheet">
    <link href="<?=base_url('admin/vendor/fontawesome/css/solid.min.css')?>" rel="stylesheet">
    <link href="<?=base_url('admin/vendor/fontawesome/css/brands.min.css')?>" rel="stylesheet">
    <link href="<?=base_url('admin/css/auth.css')?>" rel="stylesheet">
</head>

<body>
    <div class="wrapper">
        <div class="auth-content">
            <div class="card">
                <div class="card-body text-center">
                    <div class="mb-4">
                        <img class="brand" src="<?=base_url('admin/img/bootstraper-logo.png')?>" alt="bootstraper logo">
                    </div>
                    <h6 class="mb-4 text-muted">Login to your account</h6>
                    <?php $this -> load -> view ('includes/alert_errors'); ?>
                    <?php echo form_open( base_url('adminauth/login')); ?>
                        <div class="mb-3 text-start">
                            <label for="email" class="form-label">Email adress</label>
                            <input type="email" value="<?=isset($remember['admin_email']) ? $remember['admin_email'] : null;?>" name="admin_email" class="form-control" placeholder="Enter Email" required>
                        </div>
                        <div class="mb-3 text-start">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" value="<?=isset($remember['admin_password']) ? $remember['admin_password'] : null;?>" name="admin_password" class="form-control" placeholder="Password" required>
                        </div>
                        <div class="mb-3 text-start">
                            <div class="form-check">
                              <input class="form-check-input" name="remember_admin" type="checkbox" id="check1">
                              <label class="form-check-label" for="check1">
                                Remember me on this device
                              </label>
                            </div>
                        </div>
                        <button class="btn btn-primary shadow-2 mb-4 w-100">Login</button>
                    <?php echo form_close(); ?>
                </div>
            </div>
        </div>
    </div>
    <script src="<?=base_url('admin/vendor/jquery/jquery.min.js')?>"></script>
    <script src="<?=base_url('admin/vendor/bootstrap/js/bootstrap.min.js')?>"></script>
</body>

</html>