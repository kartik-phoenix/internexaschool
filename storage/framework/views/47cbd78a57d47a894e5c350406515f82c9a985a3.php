<?php $__env->startSection('title'); ?>
<?php echo e(__('update_profile')); ?>

<?php $__env->stopSection(); ?>


<?php $__env->startSection('content'); ?>
<div class="content-wrapper">
    <div class="page-header">
        <h3 class="page-title">
            <?php echo e(__('update_profile')); ?>

        </h3>
    </div>
    <div class="row">
        <div class="col-lg-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <form class="pt-3" id="admin-profile-update" enctype="multipart/form-data" action="<?php echo e(route('update-profile')); ?>" method="POST" novalidate="novalidate">
                        <?php echo csrf_field(); ?>
                        <div class="row">
                            <?php echo Form::hidden('id', "$admin_data->id", ['class' => 'form-control']); ?>


                            <div class="form-group col-sm-12 col-md-4">
                                <label><?php echo e(__('first_name')); ?> <span class="text-danger">*</span></label>
                                <?php echo Form::text('first_name', "$admin_data->first_name", ['placeholder' => __('first_name'), 'class' => 'form-control']); ?>

                            </div>
                            <div class="form-group col-sm-12 col-md-4">
                                <label><?php echo e(__('last_name')); ?> <span class="text-danger">*</span></label>
                                <?php echo Form::text('last_name', "$admin_data->last_name", ['placeholder' => __('last_name'), 'class' => 'form-control']); ?>


                            </div>
                            <div class="form-group col-sm-12 col-md-4">
                                <label><?php echo e(__('mobile')); ?></label>
                                <?php echo Form::text('mobile', "$admin_data->mobile", ['placeholder' => __('mobile'), 'class' => 'form-control']); ?>

                            </div>
                            <div class="form-group col-sm-12 col-md-12">
                                <label><?php echo e(__('gender')); ?> <span class="text-danger">*</span></label><br>
                                <div class="d-flex">
                                    <div class="form-check form-check-inline">
                                        <label class="form-check-label">
                                            <?php echo Form::radio('gender','male',Str::lower($admin_data->gender) == 'male' ? 'checked':''); ?>

                                            <?php echo e(__('male')); ?>

                                        </label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <label class="form-check-label">
                                            <?php echo Form::radio('gender','female', Str::lower($admin_data->gender) == 'female' ? 'checked':''); ?>

                                            <?php echo e(__('female')); ?>

                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group col-sm-12 col-md-4">
                                <label><?php echo e(__('image')); ?> <span class="text-danger">*</span></label>
                                <input type="file" name="image" class="file-upload-default" />
                                <div class="input-group col-xs-12">
                                    <input type="text" class="form-control file-upload-info" disabled="" placeholder="<?php echo e(__('image')); ?>" required="required" />
                                    <span class="input-group-append">
                                        <button class="file-upload-browse btn btn-theme" type="button"><?php echo e(__('upload')); ?></button>
                                    </span>
                                </div>
                                <div style="width: 40px;">
                                    <img src="<?php echo e($admin_data->image); ?>" id="edit-user-image-tag" class="img-fluid w-100" />
                                </div>
                            </div>
                            <div class="form-group col-sm-12 col-md-4">
                                <label><?php echo e(__('dob')); ?> <span class="text-danger">*</span></label>
                                <?php
                                    $date = date("m/d/Y", strtotime($admin_data->dob));
                                ?>
                                <?php echo Form::text('dob', $date  , ['placeholder' => __('dob'), 'class' => 'datepicker-popup form-control']); ?>

                                <span class="input-group-addon input-group-append">
                                </span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-12">
                                <label><?php echo e(__('current_address')); ?> <span class="text-danger">*</span></label>
                                <?php echo Form::textarea('current_address', $admin_data->current_address, ['placeholder' => __('current_address'), 'class' => 'form-control', 'id' => 'current_address','rows'=>2]); ?>

                            </div>
                            <div class="form-group col-12">
                                <label><?php echo e(__('permanent_address')); ?> <span class="text-danger">*</span></label>
                                <?php echo Form::textarea('permanent_address', $admin_data->permanent_address, ['placeholder' => __('permanent_address'), 'class' => 'form-control', 'id' => 'permanent_address','rows'=>2]); ?>

                            </div>
                        </div>
                        <input class="btn btn-theme" type="submit" value=<?php echo e(__('submit')); ?>>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('js'); ?>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.master', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/html/internexaschool_clone/resources/views/settings/update_profile.blade.php ENDPATH**/ ?>