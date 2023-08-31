<?php $__env->startSection('title'); ?>
    <?php echo e(__('general_settings')); ?>

<?php $__env->stopSection(); ?>


<?php $__env->startSection('content'); ?>
    <div class="content-wrapper">
        <div class="page-header">
            <h3 class="page-title">
                <?php echo e(__('general_settings')); ?>

            </h3>
        </div>
        <div class="row grid-margin">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <form id="frmData" class="general-setting" action="<?php echo e(url('settings')); ?>" novalidate="novalidate" enctype="multipart/form-data">
                            <?php echo csrf_field(); ?>
                            <div class="row">
                                <div class="form-group col-md-6 col-sm-12">
                                    <label><?php echo e(__('school_name')); ?></label>
                                    <input name="school_name" value="<?php echo e(isset($settings['school_name']) ? $settings['school_name'] : ''); ?>" type="text" required placeholder="<?php echo e(__('school_name')); ?>" class="form-control"/>
                                </div>
                                <div class="form-group col-md-6 col-sm-12">
                                    <label><?php echo e(__('school_email')); ?></label>
                                    <input name="school_email" value="<?php echo e(isset($settings['school_email']) ? $settings['school_email'] : ''); ?>" type="email" required placeholder="<?php echo e(__('school_email')); ?>" class="form-control"/>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-6 col-sm-12">
                                    <label><?php echo e(__('school_phone')); ?></label>
                                    <input name="school_phone" value="<?php echo e(isset($settings['school_phone']) ? $settings['school_phone'] : ''); ?>" type="text" required placeholder="<?php echo e(__('school_phone')); ?>" class="form-control"/>
                                </div>
                                <div class="form-group col-md-6 col-sm-12">
                                    <label><?php echo e(__('school_tagline')); ?></label>
                                    <textarea name="school_tagline" required placeholder="<?php echo e(__('school_tagline')); ?>" class="form-control"><?php echo e(isset($settings['school_tagline']) ? $settings['school_tagline'] : ''); ?></textarea>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-6 col-sm-12">
                                    <label><?php echo e(__('school_address')); ?></label>
                                    <textarea name="school_address" required placeholder="<?php echo e(__('school_address')); ?>" class="form-control"><?php echo e(isset($settings['school_address']) ? $settings['school_address'] : ''); ?></textarea>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-4 col-sm-12">
                                    <label><?php echo e(__('time_zone')); ?></label>
                                    <select name="time_zone" required class="form-control" style="width:100%">
                                        <?php $__currentLoopData = $getTimezoneList; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $timezone): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                            <option value="<?php  echo $timezone[2]; ?>"
                                                <?php echo e(isset($settings['time_zone']) ? ($settings['time_zone'] == $timezone[2] ? 'selected' : '') : ''); ?>>
                                                <?php  echo $timezone[2] .' - GMT ' . $timezone[1] .' - '.$timezone[0] ?></option>
                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                    </select>
                                </div>
                                <div class="form-group col-md-4 col-sm-12">
                                    <label><?php echo e(__('date_formate')); ?></label>
                                    <select name="date_formate" required class="form-control">
                                        <?php $__currentLoopData = $getDateFormat; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $dateformate): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                            <option value="<?php echo e($key); ?>"<?php echo e(isset($settings['date_formate']) ? ($settings['date_formate'] == $key ? 'selected' : '') : ''); ?>><?php echo e($dateformate); ?></option>
                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                    </select>
                                </div>
                                <div class="form-group col-md-4 col-sm-12">
                                    <label><?php echo e(__('time_formate')); ?></label>
                                    <select name="time_formate" required class="form-control">
                                        <?php $__currentLoopData = $getTimeFormat; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $timeformate): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                            <option value="<?php echo e($key); ?>"<?php echo e(isset($settings['time_formate']) ? ($settings['time_formate'] == $key ? 'selected' : '') : ''); ?>><?php echo e($timeformate); ?></option>
                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-4 col-sm-12">
                                    <label><?php echo e(__('favicon')); ?> <span class="text-danger">*</span></label>
                                    <input type="file" name="favicon" class="file-upload-default" accept="images/*"/>
                                    <div class="input-group col-xs-12">
                                        <input type="text" class="form-control file-upload-info" accept="images/*" disabled="" placeholder="<?php echo e(__('favicon')); ?>"/>
                                        <span class="input-group-append">
                                          <button class="file-upload-browse btn btn-theme" type="button"><?php echo e(__('upload')); ?></button>
                                        </span>
                                        <div class="col-md-12">
                                            <img height="50px" src='<?php echo e(isset($settings['favicon']) ?asset('public/storage/'.$settings['favicon']) : ''); ?>'>
                                            
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-md-4 col-sm-12">
                                    <label><?php echo e(__('horizontal_logo')); ?> <span class="text-danger">*</span></label>
                                    <input type="file" name="logo1" class="file-upload-default" accept="images/*"/>
                                    <div class="input-group col-xs-12">
                                        <input type="text" class="form-control file-upload-info" accept="images/*" disabled="" placeholder="<?php echo e(__('logo1')); ?>"/>
                                        <span class="input-group-append">
                                          <button class="file-upload-browse btn btn-theme" type="button"><?php echo e(__('upload')); ?></button>
                                        </span>
                                        <div class="col-md-12">
                                            <img height="100%" src='<?php echo e(isset($settings['logo1']) ? asset('public/storage/'.$settings['logo1']) : ''); ?>'>
                                            
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-md-4 col-sm-12">
                                    <label><?php echo e(__('vertical_logo')); ?> <span class="text-danger">*</span></label>
                                    <input type="file" name="logo2" class="file-upload-default" accept="images/*"/>
                                    <div class="input-group col-xs-12">
                                        <input type="text" class="form-control file-upload-info" accept="images/*" disabled="" placeholder="<?php echo e(__('logo2')); ?>"/>
                                        <span class="input-group-append">
                                          <button class="file-upload-browse btn btn-theme" type="button"><?php echo e(__('upload')); ?></button>
                                        </span>
                                        <div class="col-md-12">
                                            <img height="50px" src='<?php echo e(isset($settings['logo2']) ?  asset('public/storage/'.$settings['logo2']) : ''); ?>'>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-4 col-sm-12">
                                    <label><?php echo e(__('color')); ?></label>
                                    <input name="theme_color" value="<?php echo e(isset($settings['theme_color']) ? $settings['theme_color'] : ''); ?>" type="text" required placeholder="<?php echo e(__('color')); ?>" class="color-picker"/>
                                </div>
                                <div class="form-group col-md-4 col-sm-12">
                                    <label><?php echo e(__('session_years')); ?></label>
                                    <select name="session_year" required class="form-control">
                                        <?php $__currentLoopData = $session_year; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $year): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                            <option value="<?php echo e($year->id); ?>"<?php echo e(isset($settings['session_year']) ? ($settings['session_year'] == $year->id ? 'selected' : '') : ''); ?>><?php echo e($year->name); ?></option>
                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                    </select>
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

<?php $__env->startSection('script'); ?>
    <script type='text/javascript'>
        if ($(".color-picker").length) {
            $('.color-picker').asColorPicker();
        }

        $("#frmData").validate({
            rules: {
                username: "required",
                password: "required",
            },
            errorPlacement: function (label, element) {
                label.addClass('mt-2 text-danger');
                label.insertAfter(element);
            },
            highlight: function (element, errorClass) {
                $(element).parent().addClass('has-danger')
                $(element).addClass('form-control-danger')
            }
        });
    </script>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.master', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/html/internexaschool_clone/resources/views/settings/index.blade.php ENDPATH**/ ?>