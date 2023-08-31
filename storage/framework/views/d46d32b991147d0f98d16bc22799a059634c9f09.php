<script src="<?php echo e(asset('public/assets/js/vendor.bundle.base.js')); ?>"></script>
<script src="<?php echo e(asset('public/assets/js/Chart.min.js')); ?>"></script>
<script src="<?php echo e(asset('public/assets/js/jquery.validate.min.js')); ?>"></script>
<script src="<?php echo e(asset('public/assets/jquery-toast-plugin/jquery.toast.min.js')); ?>"></script>
<script src="<?php echo e(asset('public/assets/select2/select2.min.js')); ?>"></script>

<script src="<?php echo e(asset('public/assets/js/off-canvas.js')); ?>"></script>
<script src="<?php echo e(asset('public/assets/js/hoverable-collapse.js')); ?>"></script>
<script src="<?php echo e(asset('public/assets/js/misc.js')); ?>"></script>
<script src="<?php echo e(asset('public/assets/js/settings.js')); ?>"></script>
<script src="<?php echo e(asset('public/assets/js/todolist.js')); ?>"></script>
<script src="<?php echo e(asset('public/assets/js/ekko-lightbox.min.js')); ?>"></script>


<script src="<?php echo e(asset('public/assets/bootstrap-table/bootstrap-table.min.js')); ?>"></script>
<script src="<?php echo e(asset('public/assets/bootstrap-table/bootstrap-table-mobile.js')); ?>"></script>
<script src="<?php echo e(asset('public/assets/bootstrap-table/bootstrap-table-export.min.js')); ?>"></script>
<script src="<?php echo e(asset('public/assets/bootstrap-table/fixed-columns.min.js')); ?>"></script>
<script src="<?php echo e(asset('public/assets/bootstrap-table/tableExport.min.js')); ?>"></script>
<script src="<?php echo e(asset('public/assets/bootstrap-table/jspdf.min.js')); ?>"></script>
<script src="<?php echo e(asset('public/assets/bootstrap-table/jspdf.plugin.autotable.js')); ?>"></script>


<script src="<?php echo e(asset('public/assets/js/jquery.cookie.js')); ?>"></script>
<script src="<?php echo e(asset('public/assets/js/sweetalert2.all.min.js')); ?>"></script>
<script src="<?php echo e(asset('public/assets/js/datepicker.min.js')); ?>"></script>
<script src="<?php echo e(asset('public/assets/js/jquery.repeater.js')); ?>"></script>
<script src="<?php echo e(asset('public/assets/tinymce/tinymce.min.js')); ?>"></script>

<script src="<?php echo e(asset('public/assets/color-picker/jquery-asColor.min.js')); ?>"></script>
<script src="<?php echo e(asset('public/assets/color-picker/color.min.js')); ?>"></script>

<script src="<?php echo e(asset('public/assets/js/custom/validate.js')); ?>"></script>
<script src="<?php echo e(asset('public/assets/js/custom/function.js')); ?>"></script>
<script src="<?php echo e(asset('public/assets/js/custom/custom.js')); ?>"></script>
<script src="<?php echo e(asset('public/assets/js/custom/custom-bootstrap-table.js')); ?>"></script>


<?php if($errors->any()): ?>
    <?php $__currentLoopData = $errors->all(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $error): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
        <script type='text/javascript'>
            $.toast({
                text: '<?php echo e($error); ?>',
                showHideTransition: 'slide',
                icon: 'error',
                loaderBg: '#f2a654',
                position: 'top-right'
            });
        </script>
    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
<?php endif; ?>

<?php if(Session::has('success')): ?>
    <script>
        $.toast({
            text: '<?php echo e(Session::get('success')); ?>',
            showHideTransition: 'slide',
            icon: 'success',
            loaderBg: '#f96868',
            position: 'top-right'
        });
    </script>
<?php endif; ?>

<script>
    $(document).on('click', '.deletedata', function() {
        Swal.fire({
            title: "<?php echo e(__('delete_title')); ?>",
            text: "<?php echo e(__('confirm_message')); ?>",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: "<?php echo e(__('yes_delete')); ?>"
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: $(this).attr('data-url'),
                    type: "DELETE",
                    success: function(response) {
                        if (response['error'] == false) {
                            showSuccessToast(response['message']);
                            $('#table_list').bootstrapTable('refresh');
                        } else {
                            showErrorToast(response['message']);
                        }
                    }
                });
            }
        })
    });
</script>
<?php /**PATH /var/www/html/internexaschool_clone/resources/views/layouts/footer_js.blade.php ENDPATH**/ ?>