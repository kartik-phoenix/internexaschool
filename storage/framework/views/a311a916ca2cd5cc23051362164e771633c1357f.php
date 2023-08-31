<?php $__env->startSection('title'); ?>
<?php echo e(__('promote_student')); ?>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
<div class="content-wrapper">
    <div class="page-header">
        <h3 class="page-title">
            <?php echo e(__('promote_students_in_next_session')); ?>

        </h3>
    </div>
    <div class="row">
        <div class="col-md-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    
                    <form action="<?php echo e(route('promote-student.store')); ?>" class="create-form" id="formdata">
                        <?php echo csrf_field(); ?>
                        <div class="row" id="toolbar">
                            <div class="form-group col-sm-12 col-md-4">
                                <label><?php echo e(__('class')); ?> <?php echo e(__('section')); ?> <span class="text-danger">*</span></label>
                                <select required name="class_section_id" id="student_class_section"
                                class="form-control select2" style="width:100%;" tabindex="-1" aria-hidden="true">
                                <option value=""><?php echo e(__('select') . ' ' . __('class')); ?></option>
                                <?php $__currentLoopData = $class_sections; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $section): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <option value="<?php echo e($section->id); ?>" data-class="<?php echo e($section->class->id); ?>">
                                    <?php echo e($section->class->name); ?> - <?php echo e($section->section->name); ?>  <?php echo e($section->class->medium->name); ?></option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </select>
                            </div>
                            <div class="form-group col-sm-12 col-md-4">
                                <label><?php echo e(__('promote_in')); ?> <span class="text-danger">*</span></label>
                                <select required name="session_year_id" id="session_year_id"
                                class="form-control select2" style="width:100%;" tabindex="-1" aria-hidden="true">
                                <option value=""><?php echo e(__('select') . ' ' . __('session_years')); ?></option>
                                <?php $__currentLoopData = $session_year; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $years): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <option value="<?php echo e($years->id); ?>"><?php echo e($years->name); ?></option>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </select>
                        </div>
                        <div class="form-group col-sm-12 col-md-4">
                            <label><?php echo e(__('promote_class')); ?> <span class="text-danger">*</span></label>
                            <select required name="new_class_section_id" id="new_student_class_section"
                            class="form-control select2" style="width:100%;" tabindex="-1" aria-hidden="true">
                            <option value=""><?php echo e(__('select') . ' ' . __('class')); ?></option>
                            <?php $__currentLoopData = $class_sections; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $section): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <option value="<?php echo e($section->id); ?>" data-class="<?php echo e($section->class->id); ?>">
                                <?php echo e($section->class->name); ?> - <?php echo e($section->section->name); ?> <?php echo e($section->class->medium->name); ?></option>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </select>
                        </div>
                    </div>
                    
                    
                    <table aria-describedby="mydesc" class='table promote_student_table' id='promote_student_table_list'
                    data-toggle="table" data-url="<?php echo e(url('promote-student-list')); ?>"
                    data-click-to-select="true" data-side-pagination="server" data-pagination="true"
                    data-page-list="[5, 10, 20, 50, 100, 200]"  data-search="true" data-toolbar="#toolbar"
                    data-show-columns="true" data-show-refresh="true" data-fixed-columns="true"
                    data-fixed-number="2" data-fixed-right-number="1" data-trim-on-search="false"
                    data-mobile-responsive="true" data-sort-name="id" data-sort-order="desc"
                    data-maintain-selected="true" data-export-types='["txt","excel"]'
                    data-export-options='{ "fileName": "promote-student-list-<?= date('d-m-y') ?>" ,"ignoreColumn": ["operate"]}'
                    data-query-params="queryParams">
                    <thead>
                        <tr>
                            <th scope="col" data-field="id" data-sortable="true" data-visible="false">
                                <?php echo e(__('id')); ?></th>
                                <th scope="col" data-field="no" data-sortable="true"><?php echo e(__('no')); ?></th>
                                
                                <th scope="col" data-field="student_id" data-sortable="true">
                                    <?php echo e(__('student_id')); ?></th>
                                    
                                    <th scope="col" data-field="name" data-sortable="false"><?php echo e(__('name')); ?>

                                    </th>
                                    <th scope="col" data-field="result" data-sortable="false"><?php echo e(__('result')); ?>

                                    </th>
                                    <th scope="col" data-field="status" data-sortable="false"><?php echo e(__('status')); ?>

                                    </th>
                                </tr>
                            </thead>
                        </table>
                        <input class="btn btn-theme btn_promote" id="create-btn" type="submit" value=<?php echo e(__('submit')); ?>>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('script'); ?>
<script>
    function queryParams(p) {
        return {
            limit: p.limit,
            sort: p.sort,
            order: p.order,
            offset: p.offset,
            search: p.search,
            'class_section_id': $('#student_class_section').val(),
            'session_year_id': $('#session_year_id').val(),
        };
    }
</script>

<script>
    $('#student_class_section').on('change', function() {
        $('#promote_student_table_list').bootstrapTable('refresh');
    });
    // $('#session_year_id').on('change', function() {
        //     $('#promote_student_table_list').bootstrapTable('refresh');
        // });
        $('.btn_promote').hide();
        function set_data(){
            $(document).ready(function()
            {
                student_class=$('#student_class_section').val();
                session_year=$('#session_year_id').val();
                promote_class=$('#new_student_class_section').val();
                
                if(student_class!='' && session_year!='' && promote_class!='')
                {
                    $('.btn_promote').show();
                }
                else{
                    $('.btn_promote').hide();
                }
            });
        }
        $('#student_class_section,#session_year_id,#new_student_class_section').on('change', function() {
            set_data();
        });
    </script>
    <?php $__env->stopSection(); ?>
    
<?php echo $__env->make('layouts.master', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/html/internexaschool_clone/resources/views/promote_student/index.blade.php ENDPATH**/ ?>