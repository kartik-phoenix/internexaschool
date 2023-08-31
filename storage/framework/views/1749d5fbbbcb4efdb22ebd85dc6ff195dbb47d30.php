<?php $__env->startSection('title'); ?>
<?php echo e(__('subject') . ' ' . __('teacher')); ?>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
<div class="content-wrapper">
    <div class="page-header">
        <h3 class="page-title">
            <?php echo e(__('manage') . ' ' . __('subject') . ' ' . __('teacher')); ?>

        </h3>
    </div>

    <div class="row">
        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('subject-teacher-create')): ?>
        <div class="col-lg-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">
                        <?php echo e(__('assign') . ' ' . __('subject') . ' ' . __('teacher')); ?>

                    </h4>
                    <form class="assign_subject_teacher pt-3" action="<?php echo e(url('subject-teachers')); ?>" method="POST" novalidate="novalidate">
                        <?php echo csrf_field(); ?>
                        <div class="row">
                            <div class="form-group col-sm-12 col-md-6">
                                <label><?php echo e(__('class')); ?> <?php echo e(__('section')); ?> <span class="text-danger">*</span></label>
                                <select name="class_section_id" id="class_section_id" class="class_section_id form-control" style="width:100%;" tabindex="-1" aria-hidden="true">
                                    <option value=""><?php echo e(__('select')); ?></option>
                                    <?php $__currentLoopData = $class_section; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $section): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <option value="<?php echo e($section->id); ?>" data-class="<?php echo e($section->class->id); ?>"> <?php echo e($section->class->name . ' ' . $section->section->name . ' - ' . $section->class->medium->name); ?></option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </select>
                            </div>
                            <div class="form-group col-sm-12 col-md-6">
                                <label><?php echo e(__('subject')); ?> <span class="text-danger">*</span></label>
                                <select name="subject_id" id="subject_id" class="subject_id form-control" style="width:100%;" tabindex="-1" aria-hidden="true">
                                    <option value=""><?php echo e(__('select')); ?></option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-sm-12 col-md-6">
                                <label><?php echo e(__('teacher')); ?> <span class="text-danger">*</span></label>
                                <select multiple name="teacher_id[]" class="form-control js-example-basic-single select2-hidden-accessible" style="width:100%;" tabindex="-1" aria-hidden="true">
                                    <?php $__currentLoopData = $teachers; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $teacher): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <option value="<?php echo e($teacher->id); ?>">
                                        <?php echo e($teacher->user->first_name . ' ' . $teacher->user->last_name); ?>

                                    </option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </select>
                            </div>
                        </div>
                        <input class="btn btn-theme" type="submit" value=<?php echo e(__('submit')); ?>>
                    </form>
                </div>
            </div>
        </div>
        <?php endif; ?>

        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('subject-teacher-list')): ?>
        <div class="col-lg-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">
                        <?php echo e(__('list') . ' ' . __('subject') . ' ' . __('teacher')); ?>

                    </h4>
                    <div class="row">

                        <div id="toolbar">
                            <div class="row">
                                <div class="col">

                                    <select name="filter_class_section_id" id="filter_class_section_id" class="form-control">
                                        <option value=""><?php echo e(__('select_class_section')); ?></option>
                                        <?php $__currentLoopData = $class_section; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $class): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option value=<?php echo e($class->id); ?>>
                                            <?php echo e($class->class->name . ' ' . $class->section->name . ' ' . $class->class->medium->name); ?>

                                        </option>
                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                    </select>

                                </div>

                                <div class="col">

                                    <select name="filter_teacher_id" id="filter_teacher_id" class="form-control">
                                        <option value=""><?php echo e(__('select_teacher')); ?></option>
                                        <?php $__currentLoopData = $teachers; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $teacher): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option value=<?php echo e($teacher->id); ?>>
                                            <?php echo e($teacher->user->first_name . ' ' . $teacher->user->last_name); ?>

                                        </option>
                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                    </select>

                                </div>

                                <div class="col">

                                    <select name="filter_subject_id" id="filter_subject_id" class="form-control">
                                        <option value=""><?php echo e(__('select_subject')); ?></option>
                                        <?php $__currentLoopData = $subjects; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $subject): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option value=<?php echo e($subject->id); ?>>
                                            <?php echo e($subject->name); ?>

                                        </option>
                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                    </select>

                                </div>

                            </div>
                        </div>
                        <div class="col-12">
                            <table aria-describedby="mydesc" class='table' id='table_list' data-toggle="table" data-url="<?php echo e(url('subject-teachers-list')); ?>" data-click-to-select="true" data-side-pagination="server" data-pagination="true" data-page-list="[5, 10, 20, 50, 100, 200]" data-search="true" data-toolbar="#toolbar" data-show-columns="true" data-show-refresh="true" data-fixed-columns="true" data-fixed-number="2" data-fixed-right-number="1" data-trim-on-search="false" data-mobile-responsive="true" data-sort-name="id" data-sort-order="desc" data-maintain-selected="true" data-export-types='["txt","excel"]' data-export-options='{ "fileName": "session-year-list-<?= date(' d-m-y') ?>
                                ","ignoreColumn": ["operate"]}'
                                data-query-params="AssignSubjectTeacherQueryParams">
                                <thead>
                                    <tr>
                                        <th scope="col" data-field="id" data-sortable="true" data-visible="false">
                                            <?php echo e(__('id')); ?></th>
                                        <th scope="col" data-field="no" data-sortable="true"><?php echo e(__('no')); ?>

                                        </th>
                                        <th scope="col" data-field="class_section_id" data-sortable="false" data-visible="false"><?php echo e(__('class_section_id')); ?></th>
                                        <th scope="col" data-field="class_section_name" data-sortable="false">
                                            <?php echo e(__('class') . ' ' . __('section') . ' ' . __('name')); ?></th>
                                        <th scope="col" data-field="subject_id" data-sortable="true" data-visible="false"><?php echo e(__('subject_id')); ?></th>
                                        <th scope="col" data-field="subject_name" data-sortable="false">
                                            <?php echo e(__('subject') . ' ' . __('name')); ?></th>
                                        <th scope="col" data-field="teacher_id" data-sortable="true" data-visible="false"><?php echo e(__('teacher_id')); ?></th>
                                        <th scope="col" data-field="teacher_name" data-sortable="false">
                                            <?php echo e(__('teacher') . ' ' . __('name')); ?></th>
                                        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->any(['subject-teacher-edit', 'subject-teacher-delete'])): ?>
                                        <th data-events="actionEvents" scope="col" data-field="operate" data-sortable="false"><?php echo e(__('action')); ?></th>
                                        <?php endif; ?>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <?php endif; ?>
    </div>
</div>


<div class="modal fade" id="editModal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">
                    <?php echo e(__('edit') . ' ' . __('subject') . ' ' . __('teacher')); ?></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true"><i class="fa fa-close"></i></span>
                </button>
            </div>
            <form id="formdata" class="editform" action="<?php echo e(url('subject-teachers')); ?>" novalidate="novalidate">
                <?php echo csrf_field(); ?>
                <div class="modal-body">
                    <input type="hidden" name="id" id="id">
                    <div class="row">
                        <div class="form-group col-sm-12 col-md-12">
                            <label><?php echo e(__('class')); ?> <?php echo e(__('section')); ?> <span class="text-danger">*</span></label>
                            <select name="class_section_id" id="edit_class_section_id" class="class_section_id form-control select2" style="width:100%;">
                                <?php $__currentLoopData = $class_section; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $section): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <option value="<?php echo e($section->id); ?>" data-class="<?php echo e($section->class->id); ?>">
                                    <?php echo e($section->class->name); ?> - <?php echo e($section->section->name); ?></option>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-sm-12 col-md-12">
                            <label><?php echo e(__('subject')); ?> <span class="text-danger">*</span></label>
                            <select name="subject_id" id="edit_subject_id" class="subject_id form-control select2" style="width:100%;">
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-sm-12 col-md-12">
                            <label><?php echo e(__('teacher')); ?> <span class="text-danger">*</span></label>
                            <select name="teacher_id" id="edit_teacher_id" class="form-control select2" style="width:100%;">
                                <?php $__currentLoopData = $teachers; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $teacher): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <option value="<?php echo e($teacher->id); ?>">
                                    <?php echo e($teacher->user->first_name . ' ' . $teacher->user->last_name); ?>

                                </option>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <input class="btn btn-theme" type="submit" value=<?php echo e(__('submit')); ?>>
                    <button type="button" class="btn btn-light" data-dismiss="modal"><?php echo e(__('cancel')); ?></button>
                </div>
            </form>
        </div>
    </div>
</div>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('script'); ?>
<script>
    window.actionEvents = {
        'click .editdata': function (e, value, row, index) {
            $('#id').val(row.id);
            $('#edit_class_section_id').val(row.class_section_id).trigger('change',row.subject_id);
            setTimeout(() => {
                $('#edit_subject_id').val(row.subject_id).trigger('change');
            }, 1000);
            $('#edit_teacher_id').val(row.teacher_id).trigger('change');
        }
    };
</script>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.master', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/html/internexaschool_clone/resources/views/subject/teacher.blade.php ENDPATH**/ ?>