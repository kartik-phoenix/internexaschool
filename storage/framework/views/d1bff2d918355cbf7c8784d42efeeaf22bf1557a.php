<?php $__env->startSection('title'); ?>
    <?php echo e(__('assign_new_student_class')); ?>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
    <div class="content-wrapper">
        <div class="page-header">
            <h3 class="page-title">
                <?php echo e(__('assign_new_student_class')); ?>

            </h3>
        </div>

        <div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
                        <form action="<?php echo e(route('students.assign-class.store')); ?>" class="assign_student_class"
                            id="formdata">
                            <?php echo csrf_field(); ?>
                            <div class="row" id="toolbar">
                                <div class="form-group col-sm-12 col-md-6">
                                    <select required name="class_id" id="class_id" class="form-control select2"
                                        style="width:100%;" tabindex="-1" aria-hidden="true">
                                        <option value=""><?php echo e(__('class')); ?></option>
                                        <?php $__currentLoopData = $class; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $class): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                            <option value="<?php echo e($class->id); ?>">
                                                <?php echo e($class->name . ' ' . $class->medium->name); ?>

                                            </option>
                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                    </select>
                                </div>
                                <div class="form-group col-sm-12 col-md-6">
                                    <select required name="class_section_id" class="form-control select2"
                                        id="class_section_id" style="width:100%;" tabindex="-1" aria-hidden="true">
                                        <option value=""><?php echo e(__('class_section')); ?></option>
                                        <?php $__currentLoopData = $class_section; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $class_section): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                            <option value="<?php echo e($class_section->id); ?>">
                                                <?php echo e($class_section->class->name . ' - ' . $class_section->section->name . ' ' . $class_section->class->medium->name); ?>

                                            </option>
                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                    </select>
                                </div>
                                <textarea readonly hidden name="selected_id" id="all_id"></textarea>
                            </div>
                            <div class="assign_student_show">
                                <table aria-describedby="mydesc" class='table' id='assign_table_list' data-toggle="table"
                                    data-url="<?php echo e(route('students.new-student-list')); ?>" data-click-to-select="true"
                                    data-side-pagination="server" data-pagination="true"
                                    data-page-list="[5, 10, 20, 50, 100, 200]" data-search="true" data-toolbar="#toolbar"
                                    data-show-columns="true" data-show-refresh="true" data-fixed-columns="true"
                                    data-fixed-number="2" data-fixed-right-number="1" data-trim-on-search="false"
                                    data-mobile-responsive="true" data-sort-name="id" data-sort-order="desc"
                                    data-maintain-selected="true" data-export-types='["txt","excel"]'
                                    data-export-options='{ "fileName": "new-students-list-<?= date('d-m-y') ?>"
                                    ,"ignoreColumn": ["operate"]}'
                                    data-query-params="queryParams">
                                    <thead>
                                        <tr>
                                            <th scope="col" data-field="chk" data-sortable="false">#</th>
                                            <th scope="col" data-field="id" data-sortable="true" data-visible="false">
                                                <?php echo e(__('id')); ?></th>
                                            <th scope="col" data-field="no" data-sortable="true"><?php echo e(__('no')); ?>

                                            </th>
                                            <th scope="col" data-field="user_id" data-sortable="false"
                                                data-visible="false">
                                                <?php echo e(__('user_id')); ?></th>
                                            <th scope="col" data-field="first_name" data-sortable="false">
                                                <?php echo e(__('first_name')); ?>

                                            </th>
                                            <th scope="col" data-field="last_name" data-sortable="false">
                                                <?php echo e(__('last_name')); ?>

                                            </th>
                                            <th scope="col" data-field="image" data-sortable="false"
                                                data-formatter="imageFormatter"><?php echo e(__('image')); ?></th>
                                            <th scope="col" data-field="class_section_name" data-sortable="false">
                                                <?php echo e(__('class') . ' ' . __('section')); ?></th>
                                            <th scope="col" data-field="admission_no" data-sortable="false">
                                                <?php echo e(__('admission_no')); ?></th>
                                            <th scope="col" data-field="roll_number" data-sortable="false">
                                                <?php echo e(__('roll_no')); ?>

                                            </th>
                                        </tr>
                                    </thead>
                                </table>
                            </div>
                            <input class="btn btn-theme" id="btn_assign" type="submit" value=<?php echo e(__('submit')); ?>>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>


<?php $__env->startSection('js'); ?>
    <script>
        function queryParams(p) {
            return {
                limit: p.limit,
                sort: p.sort,
                order: p.order,
                offset: p.offset,
                search: p.search,
                'class_id': $('#class_id').val(),
            };
        }
    </script>
    <script>
        $('#class_id').on('change', function() {
            $('#assign_table_list').bootstrapTable('refresh');
        });
    </script>
    <script type="text/javascript">
        selected_student = [];
        $('#btn_assign').hide();
        $(document).on('click', '.assign_student', function(e) {
            if (this.checked == true) {
                selected_student.push($(this).val());

            } else {

                var index = selected_student.indexOf($(this).val());
                if (index > -1) {
                    selected_student.splice(index, 1);
                }
            }
            $('#all_id').val(selected_student);
            if ($('#all_id').val() != '') {
                $('#btn_assign').show();
            } else {
                $('#btn_assign').hide();
            }
        });
    </script>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.master', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/html/internexaschool_clone/resources/views/students/assign-class.blade.php ENDPATH**/ ?>