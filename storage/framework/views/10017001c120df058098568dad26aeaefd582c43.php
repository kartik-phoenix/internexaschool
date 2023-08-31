<?php $__env->startSection('title'); ?>
    <?php echo e(__('create') . ' ' . __('school')); ?>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
    <div class="content-wrapper">
        <div class="page-header">
            <h3 class="page-title">
                <?php echo e(__('School')); ?>

            </h3>
        </div>
        <div class="row grid-margin">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <form id="frmData" class="general-setting" action="<?php echo e(route('masterschool.store')); ?>" method="POST" novalidate="novalidate" enctype="multipart/form-data">
                            <?php echo csrf_field(); ?>
                            <div class="row">
                                <div class="form-group col-md-6 col-sm-12">
                                    <label>School Name</label>
                                    <input name="school_name" type="text" required placeholder="<?php echo e(__('School Name')); ?>" class="form-control"/>
                                </div>
                                <div class="form-group col-md-6 col-sm-12">
                                    <label><?php echo e(__('status')); ?></label>
                                    
                                    <select required name="status" id="status" class="form-control select2 valid" style="width:100%;" tabindex="-1" aria-hidden="true" aria-invalid="false">
                                        <option value="1" selected>Active</option>
                                        <option value="0">Inactive</option>
                                    </select>
                                </div> 
                                
                            </div>
                            
                            <input class="btn btn-theme" type="submit" value="Submit">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="row grid-margin">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <table class='table'>
                            <thead>
                                <tr>
                                    <th scope="col" data-visible="false"><?php echo e(__('id')); ?></th>
                                    <th scope="col"><?php echo e(__('School Name')); ?></th>
                                    <th scope="col"><?php echo e(__('Status')); ?></th>
                                    <th scope="col"><?php echo e(__('Created Date')); ?></th>
                                    <th data-events="actionEvents" scope="col" data-field="operate" data-sortable="false"><?php echo e(__('action')); ?></th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $__empty_1 = true; $__currentLoopData = $schools; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $school): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                                    <tr>
                                        <td><?php echo e($loop->iteration); ?></td>
                                        <td><?php echo e($school->school_name); ?></td>
                                        <td><?php echo e(($school->status == 1) ?  "Active" : 'Inactive'); ?></td>
                                        <td><?php echo e($school->created_at); ?></td>
                                        <td>  
                                            <select required name="status" id="status" onchange="schoolStatus(this.value, <?php echo e($school->id); ?>)" class="form-control select2 valid" style="width:100%;" tabindex="-1" aria-hidden="true" aria-invalid="false">
                                                <option value="1" <?php echo e(($school->status == 1) ?  "selected" : ''); ?>>Active</option>
                                                <option value="0" <?php echo e(($school->status == 0) ?  "selected" : ''); ?>>Inactive</option>
                                            </select>
                                        </td>
                                    </tr>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                                    <tr>
                                        <td colspan="5">Record Not Found</td>
                                    </tr>
                                <?php endif; ?>
                                
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('js'); ?>
    <script>
        function schoolStatus(val, id) {
            let url = "<?php echo e(route('masterschool.update', ':id')); ?>";
            url = url.replace(':id', id);
            $.ajax({
                type: "put",
                url: url,
                data: {
                    "status" : val
                },
                dataType: "json",
                success: function (response) {
                    window.location.reload();

                }
            });
        }
    </script>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.master', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/html/internexaschool/resources/views/school/index.blade.php ENDPATH**/ ?>