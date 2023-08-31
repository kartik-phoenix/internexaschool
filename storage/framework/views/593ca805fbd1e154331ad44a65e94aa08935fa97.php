<?php
    $lang = Session::get('language');
?>
<link rel="stylesheet" href="<?php echo e(asset('public/assets/css/vendor.bundle.base.css')); ?>">

<link rel="stylesheet" href="<?php echo e(asset('public/assets/fonts/font-awesome.min.css')); ?>"/>
<link rel="stylesheet" href="<?php echo e(asset('public/assets/select2/select2.min.css')); ?>">
<link rel="stylesheet" href="<?php echo e(asset('public/assets/jquery-toast-plugin/jquery.toast.min.css')); ?>">
<link rel="stylesheet" href="<?php echo e(asset('public/assets/color-picker/color.min.css')); ?>">
<?php if($lang): ?>
    <?php if($lang->is_rtl): ?>
        <link rel="stylesheet" href="<?php echo e(asset('public/assets/css/rtl.css')); ?>">
    <?php else: ?>
        <link rel="stylesheet" href="<?php echo e(asset('public/assets/css/style.css')); ?>">
    <?php endif; ?>
<?php else: ?>
    <link rel="stylesheet" href="<?php echo e(asset('public/assets/css/style.css')); ?>">
<?php endif; ?>
<link rel="stylesheet" href="<?php echo e(asset('public/assets/css/datepicker.min.css')); ?>">
<link rel="stylesheet" href="<?php echo e(asset('public/assets/css/ekko-lightbox.css')); ?>">

<link rel="stylesheet" href="<?php echo e(asset('public/assets/bootstrap-table/bootstrap-table.min.css')); ?>">
<link rel="stylesheet" href="<?php echo e(asset('public/assets/bootstrap-table/fixed-columns.min.css')); ?>">


<link rel="shortcut icon" href="<?php echo e(asset('public/storage/'. env('FAVICON'))); ?>"/>

<?php
    $theme_color = getSettings('theme_color');
    // echo json_encode($theme_color);
    $theme_color = $theme_color['theme_color'];
?>
<style>
    :root {
        --theme-color: <?=$theme_color ?>;
    }
</style>
<script>
    var baseUrl = "<?php echo e(URL::to('/')); ?>";
</script>
<?php /**PATH /var/www/html/internexaschool_clone/resources/views/layouts/include.blade.php ENDPATH**/ ?>