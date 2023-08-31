<!-- partial:../../partials/_sidebar.html -->
<nav class="sidebar sidebar-offcanvas" id="sidebar">
    <ul class="nav">
        
        <li class="nav-item">
            <a href="<?php echo e(url('/')); ?>" class="nav-link"> <span class="menu-title"><?php echo e(__('dashboard')); ?></span> <i class="fa fa-home menu-icon"></i> </a>
        </li>

        <?php if(\Spatie\Permission\PermissionServiceProvider::bladeMethodWrapper('hasRole', 'Super Admin')): ?>
        
        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->any(['medium-create','section-create','subject-create','class-create','subject-create','class-teacher-create','subject-teacher-list','subject-teachers-create','assign-class-to-new-student','promote-student-create'])): ?>
            <li class="nav-item">
                <a class="nav-link" data-toggle="collapse" href="#academics-menu" aria-expanded="false" aria-controls="academics-menu"> <span class="menu-title"><?php echo e(__('academics')); ?></span> <i class="fa fa-university menu-icon"></i> </a>
                <div class="collapse" id="academics-menu">
                    <ul class="nav flex-column sub-menu">
                        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('medium-create')): ?>
                            <li class="nav-item">
                                <a class="nav-link" href="<?php echo e(route('medium.index')); ?>"> <?php echo e(__('medium')); ?> </a>
                            </li>
                        <?php endif; ?>

                        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('section-create')): ?>
                            <li class="nav-item">
                                <a class="nav-link" href="<?php echo e(route('section.index')); ?>"> <?php echo e(__('section')); ?> </a>
                            </li>
                        <?php endif; ?>

                        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('subject-create')): ?>
                            <li class="nav-item">
                                <a class="nav-link" href="<?php echo e(route('subject.index')); ?>"> <?php echo e(__('subject')); ?> </a>
                            </li>
                        <?php endif; ?>

                        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('class-create')): ?>
                            <li class="nav-item">
                                <a class="nav-link" href="<?php echo e(route('class.index')); ?>"> <?php echo e(__('class')); ?> </a>
                            </li>
                        <?php endif; ?>

                        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('subject-create')): ?>
                            <li class="nav-item">
                                <a class="nav-link" href="<?php echo e(route('class.subject')); ?>"><?php echo e(__('assign_class_subject')); ?> </a>
                            </li>
                        <?php endif; ?>
                        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('class-teacher-create')): ?>
                            <li class="nav-item">
                                <a class="nav-link" href="<?php echo e(route('class.teacher')); ?>">
                                    <?php echo e(__('assign_class_teacher')); ?>

                                </a>
                            </li>
                        <?php endif; ?>

                        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->any(['subject-teacher-list','subject-teacher-create','subject-teacher-edit','subject-teacher-delete'])): ?>
                            <li class="nav-item">
                                <a class="nav-link" href="<?php echo e(route('subject-teachers.index')); ?>">
                                    <?php echo e(__('assign') . ' ' . __('subject') . ' ' . __('teacher')); ?>

                                </a>
                            </li>
                        <?php endif; ?>
                        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('assign-class-to-new-student')): ?>
                            <li class="nav-item">
                                <a class="nav-link" href="<?php echo e(route('students.assign-class')); ?>">
                                    <?php echo e(__('assign_new_student_class')); ?>

                                </a>
                            </li>
                        <?php endif; ?>
                        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('promote-student-create')): ?>
                            <li class="nav-item">
                                <a class="nav-link" href="<?php echo e(route('promote-student.index')); ?>">
                                    <?php echo e(__('promote_student')); ?>

                                </a>
                            </li>
                        <?php endif; ?>
                    </ul>
                </div>
            </li>
        <?php endif; ?>
        <?php endif; ?>

        
        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->any(['student-create','student-list','category-create','student-reset-password','class-teacher'])): ?>
            <li class="nav-item">
                <a class="nav-link" data-toggle="collapse" href="#student-menu" aria-expanded="false" aria-controls="academics-menu"> <span class="menu-title"><?php echo e(__('students')); ?></span>

                    <i class="fa fa-graduation-cap menu-icon"></i> </a>
                <div class="collapse" id="student-menu">
                    <ul class="nav flex-column sub-menu">
                        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('student-create')): ?>
                            <li class="nav-item">
                                <a class="nav-link" href="<?php echo e(route('students.create')); ?>">
                                    <?php echo e(__('student_admission')); ?>

                                </a>
                            </li>
                        <?php endif; ?>

                        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->any(['student-list','class-teacher'])): ?>
                            <li class="nav-item">
                                <a class="nav-link" href="<?php echo e(route('students.index')); ?>">
                                    <?php echo e(__('student_details')); ?>

                                </a>
                            </li>
                        <?php endif; ?>

                        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('category-create')): ?>
                            <li class="nav-item">
                                <a class="nav-link" href="<?php echo e(route('category.index')); ?>">
                                    <?php echo e(__('student_category')); ?>

                                </a>
                            </li>
                        <?php endif; ?>
                        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('student-reset-password')): ?>
                            <li class="nav-item">
                                <a class="nav-link" href="<?php echo e(route('students.reset_password')); ?>">
                                    <?php echo e(__('students') . ' ' . __('reset_password')); ?>

                                </a>
                            </li>
                        <?php endif; ?>
                        <?php if(Auth::user()->hasRole('Super Admin')): ?>
                            <li class="nav-item">
                                <a class="nav-link" href="<?php echo e(route('students.create-bulk-data')); ?>">
                                    <?php echo e(__('add_bulk_data')); ?>

                                </a>
                            </li>
                        <?php endif; ?>
                    </ul>
                </div>
            </li>
        <?php endif; ?>

        
        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('teacher-create')): ?>
            <li class="nav-item">
                <a href="<?php echo e(route('teachers.index')); ?>" class="nav-link"> <span class="menu-title"><?php echo e(__('teacher')); ?></span> <i class="fa fa-user menu-icon"></i> </a>
            </li>
        <?php endif; ?>

        
        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('parents-create')): ?>
            <li class="nav-item">
                <a href="<?php echo e(route('parents.index')); ?>" class="nav-link"> <span class="menu-title"><?php echo e(__('parents')); ?></span> <i class="fa fa-users menu-icon"></i> </a>
            </li>
        <?php endif; ?>

        
        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->any(['timetable-create','class-timetable','teacher-timetable'])): ?>
            <li class="nav-item">
                <a class="nav-link" data-toggle="collapse" href="#timetable-menu" aria-expanded="false" aria-controls="timetable-menu"> <span class="menu-title"><?php echo e(__('timetable')); ?></span>

                    <i class="fa fa-calendar menu-icon"></i> </a>
                <div class="collapse" id="timetable-menu">
                    <ul class="nav flex-column sub-menu">
                        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('timetable-create')): ?>
                            <li class="nav-item">
                                <a class="nav-link" href="<?php echo e(route('timetable.index')); ?>"><?php echo e(__('create_timetable')); ?> </a>
                            </li>
                        <?php endif; ?>
                        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->any(['class-timetable','class-teacher'])): ?>
                            <li class="nav-item">
                                <a class="nav-link" href="<?php echo e(url('class-timetable')); ?>">
                                    <?php echo e(__('class_timetable')); ?>

                                </a>
                            </li>
                        <?php endif; ?>
                        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('teacher-timetable')): ?>
                            <li class="nav-item">
                                <a class="nav-link" href="<?php echo e(url('teacher-timetable')); ?>">
                                    <?php echo e(__('teacher_timetable')); ?>

                                </a>
                            </li>
                        <?php endif; ?>
                    </ul>
                </div>
            </li>
        <?php endif; ?>

        
        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->any(['holiday-create','holiday-list'])): ?>
            <li class="nav-item">
                <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('holiday-list')): ?>
                    <a href="<?php echo e(route('holiday.index')); ?>" class="nav-link"> <span class="menu-title"><?php echo e(__('holiday_list')); ?></span> <i class="fa fa-calendar-check-o menu-icon"></i> </a>
                <?php endif; ?>
            </li>
        <?php endif; ?>

        
        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->any(['lesson-list','lesson-create','lesson-edit','lesson-delete','topic-list','topic-create','topic-edit','topic-delete'])): ?>
            <li class="nav-item">
                <a class="nav-link" data-toggle="collapse" href="#subject-lesson-menu" aria-expanded="false" aria-controls="subject-lesson-menu"> <span class="menu-title"><?php echo e(__('subject_lesson')); ?></span> <i class="fa fa-book menu-icon"></i> </a>
                <div class="collapse" id="subject-lesson-menu">
                    <ul class="nav flex-column sub-menu">
                        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->any(['lesson-list','lesson-create','lesson-edit','lesson-delete'])): ?>
                            <li class="nav-item">
                                <a class="nav-link" href="<?php echo e(url('lesson')); ?>"> <?php echo e(__('create_lesson')); ?></a>
                            </li>
                        <?php endif; ?>

                        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->any(['topic-list','topic-create','topic-edit','topic-delete'])): ?>
                            <li class="nav-item">
                                <a class="nav-link" href="<?php echo e(url('lesson-topic')); ?>"> <?php echo e(__('create_topic')); ?></a>
                            </li>
                        <?php endif; ?>
                    </ul>
                </div>
            </li>
        <?php endif; ?>

        
        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->any(['assignment-create','assignment-submission'])): ?>
            <li class="nav-item">
                <a class="nav-link" data-toggle="collapse" href="#student-assignment-menu" aria-expanded="false" aria-controls="student-assignment-menu"> <span class="menu-title"><?php echo e(__('student_assignment')); ?></span> <i class="fa fa-tasks menu-icon"></i> </a>
                <div class="collapse" id="student-assignment-menu">
                    <ul class="nav flex-column sub-menu">
                        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('assignment-create')): ?>
                            <li class="nav-item">
                                <a class="nav-link" href="<?php echo e(route('assignment.index')); ?>">
                                    <?php echo e(__('create_assignment')); ?>

                                </a>
                            </li>
                        <?php endif; ?>
                        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('assignment-submission')): ?>
                            <li class="nav-item">
                                <a class="nav-link" href="<?php echo e(route('assignment.submission')); ?>">
                                    <?php echo e(__('assignment_submission')); ?>

                                </a>
                            </li>
                        <?php endif; ?>
                    </ul>
                </div>
            </li>
        <?php endif; ?>
        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('slider-create')): ?>
            <li class="nav-item">
                <a href="<?php echo e(route('sliders.index')); ?>" class="nav-link"> <span class="menu-title"><?php echo e(__('sliders')); ?></span> <i class="fa fa-list menu-icon"></i> </a>
            </li>
        <?php endif; ?>

        
        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->any(['class-teacher'])): ?>
            <li class="nav-item">
                <a class="nav-link" data-toggle="collapse" href="#attendance-menu" aria-expanded="false" aria-controls="attendance-menu"> <span class="menu-title"><?php echo e(__('attendance')); ?></span> <i class="fa fa-check menu-icon"></i> </a>
                <div class="collapse" id="attendance-menu">
                    <ul class="nav flex-column sub-menu">
                        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('attendance-create')): ?>
                            <li class="nav-item">
                                <a class="nav-link" href="<?php echo e(route('attendance.index')); ?>">
                                    <?php echo e(__('add_attendance')); ?>

                                </a>
                            </li>
                        <?php endif; ?>

                        
                        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('attendance-list')): ?>
                            <li class="nav-item">
                                <a class="nav-link" href="<?php echo e(route('attendance.view')); ?>">
                                    <?php echo e(__('view_attendance')); ?>

                                </a>
                            </li>
                        <?php endif; ?>
                    </ul>
                </div>
            </li>
        <?php endif; ?>
        
        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('announcement-create')): ?>
            <li class="nav-item">
                <a class="nav-link" href="<?php echo e(route('announcement.index')); ?>">
                    <span class="menu-title"><?php echo e(__('announcement')); ?></span>
                    <i class="fa fa-check menu-icon"></i> </a>
            </li>
        <?php endif; ?>
        
        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->any(['exam-create','exam-timetable-create','exam-upload-marks','grade-create'])): ?>
            <li class="nav-item">
                <a class="nav-link" data-toggle="collapse" href="#exam-menu" aria-expanded="false" aria-controls="exam-menu">
                    <span class="menu-title"><?php echo e(__('exam')); ?></span>
                    <i class="fa fa-book menu-icon"></i>
                </a>
                <div class="collapse" id="exam-menu">
                    <ul class="nav flex-column sub-menu">
                        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('exam-create')): ?>
                            <li class="nav-item">
                                <a class="nav-link" href="<?php echo e(route('exams.index')); ?>"> <?php echo e(__('create_exam')); ?>

                                </a>
                            </li>
                        <?php endif; ?>
                        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('exam-timetable-create')): ?>
                            <li class="nav-item">
                                <a class="nav-link" href="<?php echo e(route('exam-timetable.index')); ?>"> <?php echo e(__('create_exam_timetable')); ?>

                                </a>
                            </li>
                        <?php endif; ?>
                        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('class-teacher')): ?>
                            <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('exam-upload-marks')): ?>

                        <li class="nav-item">
                            <a class="nav-link" href="<?php echo e(route('exams.upload-marks')); ?>">
                                <?php echo e(__('upload')); ?> <?php echo e(__('exam_marks')); ?>

                            </a>
                        </li>
                        <?php endif; ?>
                        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('exam-result')): ?>
                        <li class="nav-item">
                            <a class="nav-link" href="<?php echo e(route('exams.get-result')); ?>">
                                <?php echo e(__('students')); ?> <?php echo e(__('exam_result')); ?>

                            </a>
                        </li>
                        <?php endif; ?>
                    <?php endif; ?>
                    <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('grade-create')): ?>
                    <li class="nav-item">
                        <a class="nav-link" href="<?php echo e(route('grades')); ?>">
                            <?php echo e(__('exam')); ?> <?php echo e(__('grade')); ?>

                        </a>
                    </li>
                    <?php endif; ?>
                </ul>
            </div>
        </li>
        <?php endif; ?>
        
        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('session-year-create')): ?>
            <li class="nav-item">
                <a href="<?php echo e(route('session-years.index')); ?>" class="nav-link"> <span class="menu-title"><?php echo e(__('session_years')); ?></span> <i class="fa fa-calendar-o menu-icon"></i> </a>
            </li>
        <?php endif; ?>
        
        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->any(['setting-create','fcm-setting-create','email-setting-create','privacy-policy','contact-us','about-us','role-create'])): ?>
            <li class="nav-item">
                <a class="nav-link" data-toggle="collapse" href="#settings-menu" aria-expanded="false" aria-controls="settings-menu"> <span class="menu-title"><?php echo e(__('system_settings')); ?></span> <i class="fa fa-cog menu-icon"></i> </a>
                <div class="collapse" id="settings-menu">
                    <ul class="nav flex-column sub-menu">
                        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('setting-create')): ?>
                            <li class="nav-item">
                                <a class="nav-link" href="<?php echo e(url('app-settings')); ?>">
                                    <?php echo e(__('app_settings')); ?></a>
                            </li>
                        <?php endif; ?>
                        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('setting-create')): ?>
                            <li class="nav-item">
                                <a class="nav-link" href="<?php echo e(url('settings')); ?>">
                                    <?php echo e(__('general_settings')); ?></a>
                            </li>
                        <?php endif; ?>
                        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('language-create')): ?>
                            <li class="nav-item">
                                <a class="nav-link" href="<?php echo e(url('language')); ?>">
                                    <?php echo e(__('language_settings')); ?></a>
                            </li>
                        <?php endif; ?>
                        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('fcm-setting-create')): ?>
                            <li class="nav-item">
                                <a class="nav-link" href="<?php echo e(url('fcm-settings')); ?>"> <?php echo e(__('fcm_key')); ?>

                                </a>
                            </li>
                        <?php endif; ?>
                        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('email-setting-create')): ?>
                            <li class="nav-item">
                                <a class="nav-link" href="<?php echo e(url('email-settings')); ?>">
                                    <?php echo e(__('email_configuration')); ?>

                                </a>
                            </li>
                        <?php endif; ?>
                        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('privacy-policy')): ?>
                            <li class="nav-item">
                                <a class="nav-link" href="<?php echo e(url('privacy-policy')); ?>">
                                    <?php echo e(__('privacy_policy')); ?>

                                </a>
                            </li>
                        <?php endif; ?>
                        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('contact-us')): ?>
                            <li class="nav-item">
                                <a class="nav-link" href="<?php echo e(url('contact-us')); ?>"> <?php echo e(__('contact_us')); ?>

                                </a>
                            </li>
                        <?php endif; ?>
                        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('about-us')): ?>
                            <li class="nav-item">
                                <a class="nav-link" href="<?php echo e(url('about-us')); ?>"> <?php echo e(__('about_us')); ?>

                                </a>
                            </li>
                        <?php endif; ?>
                        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('terms-condition')): ?>
                            <li class="nav-item">
                                <a class="nav-link" href="<?php echo e(url('terms-condition')); ?>">
                                    <?php echo e(__('terms_condition')); ?>

                                </a>
                            </li>
                        <?php endif; ?>
                        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('role-create')): ?>
                            <li class="nav-item">
                                <a class="nav-link" href="<?php echo e(url('roles/')); ?>"> <?php echo e(__('role_permission')); ?>

                                </a>
                            </li>
                        <?php endif; ?>
                    </ul>
                </div>
            </li>
        <?php endif; ?>

        

    </ul>
</nav>
<?php /**PATH /var/www/html/internexaschool_clone/resources/views/layouts/sidebar.blade.php ENDPATH**/ ?>