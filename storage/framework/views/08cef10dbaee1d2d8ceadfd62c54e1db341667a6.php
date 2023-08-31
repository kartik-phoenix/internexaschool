<!-- partial:../../partials/_navbar.html -->
<?php if(Session::get('locale')): ?>
<?php echo e(app()->setLocale(Session::get('locale'))); ?>

<?php endif; ?>
<nav class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
    <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
        
        <a class="navbar-brand brand-logo" href="<?php echo e(URL::to('/')); ?>"> <img src="<?php echo e(env('LOGO1') ? asset('public/storage/'. env('LOGO1')) : url('assets/logo.svg')); ?>" alt="logo"> </a> <a class="navbar-brand brand-logo-mini" href="<?php echo e(URL::to('/')); ?>"> <img src="<?php echo e(asset('publicstorage/' . env('FAVICON'))); ?>" alt="logo"> </a>
    </div>
    <div class="navbar-menu-wrapper d-flex align-items-stretch">
        <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
            <span class="fa fa-bars"></span>
        </button>

        <?php
        $email_config_verify_value = DB::table('settings')->select('message')->where('type','email_configration_verification')->first();
        if($email_config_verify_value){
        $message = $email_config_verify_value->message;
        }else{
        $message = 0;
        }
        ?>
        <?php if($message == 0): ?>
        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('email-setting-create')): ?>
        <div class="mx-auto order-0">
            <div class="alert alert-fill-danger my-2" role="alert">
                <i class="fa fa-exclamation"></i> Email Configration is not verified <a href="<?php echo e(route('setting.email-config-index')); ?>" class="alert-link">Click here to redirect to email configration</a>.
            </div>
        </div>
        <?php endif; ?>
        <?php endif; ?>
        <ul class="navbar-nav navbar-nav-right">
            <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('class-teacher')): ?>
            <li class="nav-item">
                <?php $class_section = Auth::user()->teacher->class_section ?>
                <div class="text-dark"><?php echo e(__('class').' : '.$class_section->class->name.' '.$class_section->section->name.' - '.$class_section->class->medium->name); ?></div>
            </li>
            <?php endif; ?>
            <li class="nav-item dropdown">
                <a class="nav-link count-indicator dropdown-toggle" id="messageDropdown" href="#" data-toggle="dropdown" aria-expanded="false">
                    <i class="fa fa-language"></i>
                </a>
                <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="messageDropdown">
                    <?php $__currentLoopData = get_language(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $language): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <a class="dropdown-item preview-item" href="<?php echo e(url('set-language').'/'.$language->code); ?>">
                        <div class="preview-thumbnail">
                            
                        </div>
                        <div class="preview-item-content d-flex align-items-start flex-column justify-content-center">
                            <h6 class="preview-subject ellipsis mb-1 font-weight-normal"><?php echo e($language->name); ?></h6>
                            
                        </div>
                    </a>
                    <div class="dropdown-divider"></div>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </div>
            </li>
            <li class="nav-item nav-profile dropdown">
                <a class="nav-link dropdown-toggle" id="profileDropdown" href="#" data-toggle="dropdown" aria-expanded="true">
                    <div class="nav-profile-img">
                        <img src="<?php echo e(Auth::user()->image); ?>" alt="image">
                    </div>
                    <div class="nav-profile-text">
                        <p class="mb-1 text-black"><?php echo e(Auth::user()->first_name); ?></p>
                    </div>
                </a>
                <div class="dropdown-menu navbar-dropdown" aria-labelledby="profileDropdown">
                    <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('update-admin-profile')): ?>
                    <a class="dropdown-item" href="<?php echo e(route('edit-profile')); ?>">
                        <i class="fa fa-user mr-2"></i><?php echo e(__('update_profile')); ?></a>
                    <div class="dropdown-divider"></div>
                    <?php endif; ?>
                    <a class="dropdown-item" href="<?php echo e(route('resetpassword')); ?>">
                        <i class="fa fa-refresh mr-2 text-success"></i><?php echo e(__('change_password')); ?></a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="<?php echo e(route('logout')); ?>">
                        <i class="fa fa-sign-out mr-2 text-primary"></i> <?php echo e(__('signout')); ?>

                    </a>
                </div>
            </li>
        </ul>
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
            <span class="fa fa-bars"></span>
        </button>
    </div>
</nav>
<?php /**PATH /var/www/html/internexaschool_clone/resources/views/layouts/header.blade.php ENDPATH**/ ?>