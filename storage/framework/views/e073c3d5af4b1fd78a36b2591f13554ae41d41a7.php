<?php $__env->startSection('title'); ?> <?php echo e(__('privacy_policy')); ?> <?php $__env->stopSection(); ?>


<?php $__env->startSection('content'); ?>

<div class="content-wrapper">
  <div class="page-header">
    <h3 class="page-title">
      <?php echo e(__('privacy_policy')); ?>

    </h3>
  </div>
  <div class="row grid-margin">
    <div class="col-lg-12">
      <div class="card">
        <div class="card-body">
          <form id="formdata" class="setting-form" action="<?php echo e(url('setting-update')); ?>" method="POST" novalidate="novalidate">
            <?php echo csrf_field(); ?>
            <div class="row">
              <input type="hidden" name="type" id="type" value="<?php echo e($type); ?>">
              
              <div class="form-group col-md-12 col-sm-12">
                <textarea id="tinymce_message" name="setting_message" required placeholder="<?php echo e(__('privacy_policy')); ?>"><?php echo e(isset($settings->message) ? $settings->message : ''); ?></textarea>
                
              </div>
            </div>
            <input class="btn btn-theme" type="submit" value="Submit">
          </form>
        </div>
      </div>
    </div>
  </div>
</div>

<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.master', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/html/internexaschool_clone/resources/views/settings/privacy_policy.blade.php ENDPATH**/ ?>