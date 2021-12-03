<?php if ( $this -> session -> flashdata ('error')) : ?>
<div class="error__list error">
    <div class="error__icon">
        <i class="fa fa-exclamation-circle" aria-hidden="true"></i>
    </div>
    <div class="error__messages">
        <ul>
            <?php echo $this -> session -> flashdata ('error'); ?>
        </ul>
    </div>
</div>
<?php elseif ( $this -> session -> flashdata ('success')) : ?>
<div class="error__list success">
    <div class="error__icon">
        <i class="fa fa-check" aria-hidden="true"></i>
    </div>
    <div class="error__messages">
        <ul>
            <?php echo $this -> session -> flashdata ('success'); ?>
        </ul>
    </div>
</div>
<?php endif; ?>