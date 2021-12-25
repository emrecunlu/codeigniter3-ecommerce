<?php if ( $this -> session -> flashdata ('toastr_error')) : ?>
<script>
    toastr['error']('Hata', '<?=$this -> session -> flashdata ("toastr_error");?>');
</script>
<?php endif; ?>
<?php if ( $this -> session -> flashdata ('toastr_success')) : ?>
<script>
    toastr['success']('Başarılı', '<?=$this -> session -> flashdata ("toastr_success");?>');
</script>
<?php endif; ?>