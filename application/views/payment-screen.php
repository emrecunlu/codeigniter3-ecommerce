<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <?php $this -> load -> view ('includes/links'); ?>
</head>

<body>
    <?php $this -> load -> view ('includes/header'); ?>
    <?php $this -> load -> view ('includes/navbar'); ?>
    <div class="body">
        <div class="container py-5">
            <div id="iyzipay-checkout-form" class="responsive"></div>
        </div>
    </div>
    <div class="backdrop">
        <div class="spinner-grow text-light" role="status">
            <span class="visually-hidden">Loading...</span>
        </div>
    </div>
    <?php $this -> load -> view ('includes/scripts'); ?>
</body>

</html>