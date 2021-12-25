<?php if ( $this -> session -> flashdata ('alert_primary')) : ?>
<div class="alert alert-primary">
    <h5 class="alert-title"><i class="fas fa-info"></i> Primary</h5>
    <?=$this -> session -> flashdata ('alert_primary');?>
</div>
<?php endif; ?>
<?php if ( $this -> session -> flashdata ('alert_secondary')) : ?>
<div class="alert alert-secondary">
    <h5 class="alert-title"><i class="fas fa-question-circle"></i> Secondary</h5>
    <?=$this -> session -> flashdata ('alert_secondary');?>
</div>
<?php endif; ?>
<?php if ( $this -> session -> flashdata ('alert_success')) : ?>
<div class="alert alert-success">
    <h5 class="alert-title"><i class="fas fa-check"></i> Success</h5>
    <?=$this -> session -> flashdata ('alert_success');?>
</div>
<?php endif; ?>
<?php if ( $this -> session -> flashdata ('alert_danger')) : ?>
<div class="alert alert-danger">
    <h5 class="alert-title"><i class="fas fa-exclamation-triangle"></i> Danger</h5>
    <?=$this -> session -> flashdata ('alert_danger');?>
</div>
<?php endif; ?>