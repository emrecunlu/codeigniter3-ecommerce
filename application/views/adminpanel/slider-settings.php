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
    <title>Users | Bootstrap Simple Admin Template</title>

    <!-- OPTIONAL CSS SRC !-->
    <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css">
    <script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/dropzone@5/dist/min/dropzone.min.css" type="text/css" />
    <!-- CSS END !-->

    <?php $this -> load -> view ('includes/admin_links'); ?>

    
    <style>
        .dropzone {
            background: white;
            border-radius: 5px;
            border: 2px dashed rgb(0, 135, 247);
            border-image: none;
            margin-left: auto;
            margin-right: auto;
        }
    </style>
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

                    <?php $this -> load -> view ('includes/alert_errors'); ?>
                    
                    <form class="dropzone needsclick py-4 my-5" id="demo-upload" action="/upload">
                        <div class="dz-message needsclick">     
                            <span class="note needsclick">Yüklemek istediğniz <b>resimleri</b> sürükleyiniz veya seçiniz.</span>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
    <div class="backdrop">
        <div class="spinner-grow text-light" role="status">
            <span class="visually-hidden">Loading...</span>
        </div>
    </div>  

    <?php $this -> load -> view ('includes/admin_scripts'); ?>

    <!-- OPTIONAL JS SRC !-->
    <script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script>
    <script>
        $('.dropzone').dropzone ({
            url: '<?=base_url("admin/slider_settings");?>',
            paramName: 'file',
            maxFiles: 8,
            maxFileSize: 5,
            addRemoveLinks: true,
            acceptedFiles: '.jpeg, .jpg, .png',
            thumbnailWidth: 80,
            thumbnailHeight: 80,
            params: {
                process: 'insert'
            },
            success: function (file, response) {
                if ( response.status == 'success') {
                    alert ('');
                } else if ( response.status == 'error'){
                    $(file.previewElement).addClass("dz-error").find('.dz-error-message').text(message.Message);
                }
            },
            error: function (file, response) {
                $(file.previewElement).addClass("dz-error").find('.dz-error-message').text(message.Message);
            }
        });
    </script>
    <!-- JS END !-->

    <?php $this -> load -> view ('includes/toastr'); ?>

</body>

</html>