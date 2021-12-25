<?php if ( $this -> session -> flashdata ('alert_primary')) : ?>
<div class="alert alert-primary">
    <h5 class="alert-title"><i class="fas fa-info"></i> Bilgi</h5>
    <?=$this -> session -> flashdata ('alert_primary');?>
</div>
<?php endif; ?>
<?php if ( $this -> session -> flashdata ('alert_secondary')) : ?>
<div class="alert alert-secondary">
    <h5 class="alert-title"><i class="fas fa-question-circle"></i> Açıklama</h5>
    <?=$this -> session -> flashdata ('alert_secondary');?>
</div>
<?php endif; ?>
<?php if ( $this -> session -> flashdata ('alert_success')) : ?>
<div class="alert alert-success">
    <h5 class="alert-title"><i class="fas fa-check"></i> Başarılı</h5>
    <?=$this -> session -> flashdata ('alert_success');?>
</div>
<?php endif; ?>
<?php if ( $this -> session -> flashdata ('alert_danger')) : ?>
<div class="alert alert-danger">
    <h5 class="alert-title"><i class="fas fa-exclamation-triangle"></i> Hata</h5>
    <?=$this -> session -> flashdata ('alert_danger');?>
</div>
<?php endif; ?>